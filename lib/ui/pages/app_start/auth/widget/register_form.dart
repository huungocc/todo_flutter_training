import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_cubit.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  void _changeToLogin() {
    context.read<AuthCubit>().changeAuthType(AuthType.login);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              BaseTextLabel(
                S.of(context).create_account,
                textAlign: TextAlign.center,
                style: AppTextStyle.purpleS32Bold,
              ),
              const SizedBox(height: 20),
              BaseTextLabel(
                S.of(context).create_account_explore,
                textAlign: TextAlign.center,
                style: AppTextStyle.blackS24Bold,
                maxLines: 2,
              ),
              const SizedBox(height: 40),
              BaseTextInput(
                textController: cubit.registerEmailController,
                hintText: S.of(context).email,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                textController: cubit.registerPasswordController,
                hintText: S.of(context).password,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                textController: cubit.registerConfirmPasswordController,
                hintText: S.of(context).confirm_password,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 40),
              BlocConsumer<AuthCubit, AuthState>(
                listenWhen: (prev, curr) =>
                prev.registerLoadStatus != curr.registerLoadStatus ||
                    prev.isConfirmed != curr.isConfirmed,
                listener: (context, state) {
                  if (state.registerLoadStatus.isSuccess) {
                    _changeToLogin();
                  }
                },
                buildWhen: (prev, curr) =>
                    prev.registerLoadStatus != curr.registerLoadStatus,
                builder: (context, state) {
                  return BaseButton(
                    backgroundColor: AppColors.todoPurple,
                    height: 50,
                    onTap: state.registerLoadStatus.isLoading
                        ? null
                        : () {
                      cubit.register();
                    },
                    child: state.registerLoadStatus.isLoading
                        ? BaseLoading(
                      size: AppDimens.iconSizeNormal,
                      backgroundColor: AppColors.textBlack,
                      valueColor: AppColors.textWhite,
                    )
                        : BaseTextLabel(
                      S.of(context).sign_up,
                      style: AppTextStyle.whiteS16W500,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
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
}
