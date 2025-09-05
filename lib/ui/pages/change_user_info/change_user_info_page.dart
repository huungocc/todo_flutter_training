import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/user_info/user_info_cubit.dart';
import 'package:todo_flutter_training/global_blocs/user_info/user_info_state.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/change_user_info/change_user_info_cubit.dart';
import 'package:todo_flutter_training/ui/pages/change_user_info/change_user_info_state.dart';
import 'package:todo_flutter_training/ui/pages/change_user_info/widget/change_user_info_body.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class ChangeUserInfoPage extends StatelessWidget {
  const ChangeUserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ChangeUserInfoCubit(authRepository: getIt<AuthRepository>()),
      child: const _ChangeUserInfoBody(),
    );
  }
}

class _ChangeUserInfoBody extends StatefulWidget {
  const _ChangeUserInfoBody();

  @override
  State<_ChangeUserInfoBody> createState() => _ChangeUserInfoBodyState();
}

class _ChangeUserInfoBodyState extends State<_ChangeUserInfoBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserInfo();
    });
  }

  void _loadUserInfo() {
    context.read<UserInfoCubit>().refreshUserInfo();
  }

  void _setEditing() {
    context.read<ChangeUserInfoCubit>().setEditing();
  }

  void _uploadAvatar() {
    context.read<ChangeUserInfoCubit>().uploadAvatar();
  }

  void _updateUserInfo() {
    context.read<ChangeUserInfoCubit>().updateUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ChangeUserInfoCubit, ChangeUserInfoState>(
          listenWhen: (prev, curr) => curr.updateStatus != prev.updateStatus,
          listener: (context, state) {
            if (state.updateStatus.isSuccess) {
              _loadUserInfo();
            }
          },
        ),
        BlocListener<ChangeUserInfoCubit, ChangeUserInfoState>(
          listenWhen: (prev, curr) => curr.uploadStatus != prev.uploadStatus,
          listener: (context, state) {
            if (state.uploadStatus.isSuccess) {
              _updateUserInfo();
            }
          },
        ),
      ],
      child: BaseScreen(
        title: S.of(context).change_info,
        iconBackColor: AppColors.textWhite,
        colorAppBar: AppColors.todoPurple,
        isLightStatusBar: true,
        rightWidgets: [
          BlocBuilder<ChangeUserInfoCubit, ChangeUserInfoState>(
            buildWhen: (prev, curr) => curr.isEditing != prev.isEditing,
            builder: (context, state) {
              return IconButton(
                onPressed: _setEditing,
                icon: Icon(
                  color: AppColors.textWhite,
                  state.isEditing ? Icons.close : Icons.edit,
                ),
              );
            },
          ),
        ],
        body: BlocBuilder<UserInfoCubit, UserInfoState>(
          buildWhen: (prev, curr) => curr.loadStatus != prev.loadStatus,
          builder: (context, state) {
            if (state.loadStatus.isLoading) {
              return const BaseLoading();
            }
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ChangeUserInfoBody(),
            );
          },
        ),
        bottomBar: BottomAppBar(
          color: Colors.transparent,
          child: _buildConfirmButton(),
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return BlocBuilder<ChangeUserInfoCubit, ChangeUserInfoState>(
      buildWhen: (prev, curr) =>
      curr.updateStatus != prev.updateStatus ||
          curr.uploadStatus != prev.uploadStatus ||
          curr.avatarFile != prev.avatarFile ||
          curr.isEditing != prev.isEditing,
      builder: (context, state) {
        if (!state.isEditing) return const SizedBox.shrink();

        final isLoading =
            state.updateStatus.isLoading || state.uploadStatus.isLoading;

        return BaseButton(
          backgroundColor: AppColors.todoPurple,
          isDisable: isLoading,
          onTap: () {
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

  Widget _buildButtonChild(ChangeUserInfoState state) {
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
