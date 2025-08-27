import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/change_password/change_password_cubit.dart';
import 'package:todo_flutter_training/ui/pages/change_password/change_password_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePasswordCubit(authRepository: getIt<AuthRepository>()),
      child: const _ChangePasswordBody(),
    );
  }
}

class _ChangePasswordBody extends StatefulWidget {
  const _ChangePasswordBody();

  @override
  State<_ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<_ChangePasswordBody> {
  void _backToSetting() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    return BaseScreen(
      title: S.of(context).change_password,
      iconBackColor: AppColors.textWhite,
      colorAppBar: AppColors.todoPurple,
      isLightStatusBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            const SizedBox.shrink(),
            BaseTextInput(
              title: S.of(context).current_password,
              textController: cubit.currentPasswordController,
              isPasswordTF: true,
            ),
            BaseTextInput(
              title: S.of(context).new_password,
              textController: cubit.newPasswordController,
              isPasswordTF: true,
            ),
            BaseTextInput(
              title: S.of(context).confirm_new_password,
              textController: cubit.confirmNewPasswordController,
              isPasswordTF: true,
            ),
          ],
        ),
      ),
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: _buildConfirmButton(cubit),
      ),
    );
  }

  Widget _buildConfirmButton(ChangePasswordCubit cubit) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (prev, curr) =>
          curr.changePasswordLoadStatus != prev.changePasswordLoadStatus,
      listener: (context, state) {
        if (state.changePasswordLoadStatus.isSuccess) {
          _backToSetting();
        }
      },
      buildWhen: (prev, curr) =>
          curr.changePasswordLoadStatus != prev.changePasswordLoadStatus,
      builder: (context, state) {
        return BaseButton(
          backgroundColor: AppColors.todoPurple,
          onTap: state.changePasswordLoadStatus.isLoading
              ? null
              : () {
            cubit.changePassword();
          },
          child: state.changePasswordLoadStatus.isLoading
              ? BaseLoading(
            size: AppDimens.iconSizeNormal,
            backgroundColor: AppColors.textBlack,
            valueColor: AppColors.textWhite,
          )
              : BaseTextLabel(
            S.of(context).confirm,
            style: AppTextStyle.whiteS16W500,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
