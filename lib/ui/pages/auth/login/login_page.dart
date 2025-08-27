import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/auth/auth_cubit.dart';
import 'package:todo_flutter_training/ui/pages/auth/login/login_cubit.dart';
import 'package:todo_flutter_training/ui/pages/auth/login/login_navigator.dart';
import 'package:todo_flutter_training/ui/pages/auth/login/login_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(authRepository: getIt<AuthRepository>()),
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody> {
  void _changeToRegister() {
    context.read<AuthCubit>().changeAuthType(AuthType.register);
  }

  Future<void> _onLoginSuccess() async {
    AuthNavigator(context: context).navigateToListTodo();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              BaseTextLabel(
                S.of(context).login_here,
                textAlign: TextAlign.center,
                style: AppTextStyle.purpleS32Bold,
              ),
              const SizedBox(height: 20),
              BaseTextLabel(
                S.of(context).welcome_back,
                textAlign: TextAlign.center,
                style: AppTextStyle.blackS24Bold,
              ),
              const SizedBox(height: 40),
              BaseTextInput(
                textController: cubit.loginEmailController,
                hintText: S.of(context).email,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                textController: cubit.loginPasswordController,
                hintText: S.of(context).password,
                borderColor: AppColors.gray3,
                isPasswordTF: true,
              ),
              const SizedBox(height: 40),
              BlocConsumer<LoginCubit, LoginState>(
                listenWhen: (prev, curr) =>
                    prev.loginLoadStatus != curr.loginLoadStatus ||
                    prev.isConfirmed != curr.isConfirmed,
                listener: (context, state) {
                  if (state.loginLoadStatus.isSuccess) {
                    if (state.isConfirmed) {
                      _onLoginSuccess();
                    } else {
                      ExceptionHandler.showErrorSnackBar(
                        S.current.account_not_confirmed,
                      );
                    }
                  }
                },
                buildWhen: (prev, curr) =>
                    prev.loginLoadStatus != curr.loginLoadStatus,
                builder: (context, state) {
                  return BaseButton(
                    backgroundColor: AppColors.todoPurple,
                    height: AppDimens.buttonHeight,
                    onTap: state.loginLoadStatus.isLoading
                        ? null
                        : () {
                            cubit.login();
                          },
                    child: state.loginLoadStatus.isLoading
                        ? BaseLoading(
                            size: AppDimens.iconSizeNormal,
                            backgroundColor: AppColors.textBlack,
                            valueColor: AppColors.textWhite,
                          )
                        : BaseTextLabel(
                            S.of(context).sign_in,
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
                    _changeToRegister();
                  },
                  child: BaseTextLabel(S.of(context).create_new_account),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
