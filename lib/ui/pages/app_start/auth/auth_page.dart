import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_cubit.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_state.dart';
import 'package:todo_flutter_training/ui/widgets/auth/custom_auth_background.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(authRepository: getIt<AuthRepository>()),
      child: const _AuthBody(),
    );
  }
}

class _AuthBody extends StatefulWidget {
  const _AuthBody();

  @override
  State<_AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<_AuthBody> {
  void _changeAuthType(AuthType authType) {
    switch (authType) {
      case AuthType.login:
        context.read<AuthCubit>().changeAuthType(AuthType.login);
        break;
      case AuthType.register:
        context.read<AuthCubit>().changeAuthType(AuthType.register);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      hideAppBar: true,
      colorAppBar: Colors.transparent,
      customBackground: CustomAuthBackground(),
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (prev, curr) =>
            prev.authType != curr.authType ||
            prev.loadStatus != curr.loadStatus,
        builder: (context, state) {
          if (state.loadStatus.isLoading) {
            return const BaseLoading();
          }

          if (state.authType == AuthType.login) {
            return _loginForm();
          } else if (state.authType == AuthType.register) {
            return _registerForm();
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _loginForm({Key? key}) {
    return Container(
      key: key,
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
                hintText: S.of(context).email,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                hintText: S.of(context).password,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 40),
              BaseButton(
                title: S.of(context).sign_in,
                backgroundColor: AppColors.todoPurple,
              ),
              const SizedBox(height: 20),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _changeAuthType(AuthType.register);
                  },
                  child: BaseTextLabel(
                    S.of(context).create_new_account,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _registerForm({Key? key}) {
    return Container(
      key: key,
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
                hintText: S.of(context).email,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                hintText: S.of(context).password,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 10),
              BaseTextInput(
                hintText: S.of(context).confirm_password,
                borderColor: AppColors.gray3,
              ),
              const SizedBox(height: 40),
              BaseButton(
                title: S.of(context).sign_up,
                backgroundColor: AppColors.todoPurple,
              ),
              const SizedBox(height: 20),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _changeAuthType(AuthType.login);
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
