import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/user_info/user_info_cubit.dart';
import 'package:todo_flutter_training/ui/pages/user_info/user_info_state.dart';
import 'package:todo_flutter_training/ui/pages/user_info/widget/user_info_body.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserInfoCubit(authRepository: getIt<AuthRepository>()),
      child: const _ChangeInfoBody(),
    );
  }
}

class _ChangeInfoBody extends StatefulWidget {
  const _ChangeInfoBody();

  @override
  State<_ChangeInfoBody> createState() => _ChangeInfoBodyState();
}

class _ChangeInfoBodyState extends State<_ChangeInfoBody> {

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    context.read<UserInfoCubit>().loadUserInfo();
  }

  void _setEditing() {
    context.read<UserInfoCubit>().setEditing();
  }

  void _uploadAvatar() {
    context.read<UserInfoCubit>().uploadAvatar();
  }

  void _updateUserInfo() {
    context.read<UserInfoCubit>().updateUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: S.of(context).change_info,
      iconBackColor: AppColors.textWhite,
      colorAppBar: AppColors.todoPurple,
      isLightStatusBar: true,
      rightWidgets: [
        BlocBuilder<UserInfoCubit, UserInfoState>(
          buildWhen: (prev, curr) => curr.isEditing != prev.isEditing,
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                _setEditing();
              },
              icon: Icon(
                color: AppColors.textWhite,
                state.isEditing ? Icons.close : Icons.edit,
              )
            );
          }
        )
      ],
      body: BlocBuilder<UserInfoCubit, UserInfoState>(
        buildWhen: (prev, curr) =>
          curr.loadStatus != prev.loadStatus,
        builder: (context, state) {
          if (state.loadStatus.isLoading) {
            return const BaseLoading();
          }
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const UserInfoBody()
          );
        },
      ),
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: _buildConfirmButton(),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return BlocConsumer<UserInfoCubit, UserInfoState>(
      listenWhen: (prev, curr) =>
        curr.uploadStatus != prev.uploadStatus,
      listener: (context, state) {
        if (state.uploadStatus.isSuccess) {
          _updateUserInfo();
        }
      },
      builder: (context, state) {
        if (!state.isEditing) {
          return const SizedBox.shrink();
        }

        return BaseButton(
          backgroundColor: AppColors.todoPurple,
          onTap: state.updateStatus.isLoading || state.uploadStatus.isLoading
              ? null
              : () async {
            if (state.avatarFile != null) {
              _uploadAvatar();
            } else {
              _updateUserInfo();
            }
          },
          child: _buildButtonChild(state),
        );
      },
    );
  }

  Widget _buildButtonChild(UserInfoState state) {
    if (state.updateStatus.isLoading || state.uploadStatus.isLoading) {
      return BaseLoading(
        size: AppDimens.iconSizeNormal,
        backgroundColor: AppColors.textBlack,
        valueColor: AppColors.textWhite,
      );
    }

    return BaseTextLabel(
      S.of(context).confirm,
      style: AppTextStyle.whiteS16W500,
      textAlign: TextAlign.center,
    );
  }
}
