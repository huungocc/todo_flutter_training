import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_cubit.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_state.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/widget/login_form.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/widget/register_form.dart';
import 'package:todo_flutter_training/ui/widgets/auth/custom_auth_background.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      hideAppBar: true,
      colorAppBar: Colors.transparent,
      customBackground: CustomAuthBackground(),
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (prev, curr) =>
            prev.authType != curr.authType,
        builder: (context, state) {
          if (state.authType == AuthType.login) {
            return LoginForm();
          } else if (state.authType == AuthType.register) {
            return RegisterForm();
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
