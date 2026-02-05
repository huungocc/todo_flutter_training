import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/text_style/app_text_style.dart';
import 'package:todo_flutter_training/ui/pages/auth/auth_cubit.dart';
import 'package:todo_flutter_training/ui/pages/auth/register/register_cubit.dart';
import 'package:todo_flutter_training/ui/pages/auth/register/register_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(authRepository: getIt<AuthRepository>()),
      child: const _RegisterBody(),
    );
  }
}

class _RegisterBody extends StatefulWidget {
  const _RegisterBody();

  @override
  State<_RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<_RegisterBody> {
  void _changeToLogin() {
    context.read<AuthCubit>().changeAuthType(AuthType.login);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              /// Header
              BaseTextLabel(
                S.of(context).create_account,
                textAlign: TextAlign.center,
                style: context.appTextStyle.primary.s32.bold,
              ),
              const SizedBox(height: 20),
              BaseTextLabel(
                S.of(context).create_account_explore,
                textAlign: TextAlign.center,
                style: context.appTextStyle.onSurface.s18.bold,
                maxLines: 2,
              ),
              const SizedBox(height: 40),

              /// RegisterForm
              BaseTextInput(
                textController: cubit.registerEmailController,
                hintText: S.of(context).email,
                borderColor: AppColors.textSecondary,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                textController: cubit.registerPasswordController,
                hintText: S.of(context).password,
                borderColor: AppColors.textSecondary,
                isPasswordTF: true,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                textController: cubit.registerConfirmPasswordController,
                hintText: S.of(context).confirm_password,
                borderColor: AppColors.textSecondary,
                isPasswordTF: true,
              ),
              const SizedBox(height: 40),

              /// RegisterButton
              _buildRegisterButton(cubit),

              const SizedBox(height: 20),

              /// ChangeToLogin
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _changeToLogin();
                  },
                  child: BaseTextLabel(
                    S.of(context).already_account,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(RegisterCubit cubit) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (prev, curr) =>
      prev.registerLoadStatus != curr.registerLoadStatus,
      listener: (context, state) {
        if (state.registerLoadStatus.isSuccess) {
          _changeToLogin();
        }
      },
      buildWhen: (prev, curr) =>
          prev.registerLoadStatus != curr.registerLoadStatus,
      builder: (context, state) {
        return BaseButton(
          height: AppDimens.buttonHeight,
          onTap: state.registerLoadStatus.isLoading
              ? null
              : () {
            cubit.register();
          },
          child: state.registerLoadStatus.isLoading
              ? BaseLoading(
            size: AppDimens.iconSizeNormal,
            backgroundColor: AppColors.textPrimary,
            valueColor: AppColors.textOnDark,
          )
              : BaseTextLabel(
            S.of(context).sign_up,
            style: context.appTextStyle.onPrimary.s16.w500.copyWith(
              color: AppColors.lightSurface,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
