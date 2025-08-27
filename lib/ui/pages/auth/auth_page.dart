import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/ui/pages/auth/auth_cubit.dart';
import 'package:todo_flutter_training/ui/pages/auth/auth_state.dart';
import 'package:todo_flutter_training/ui/pages/auth/login/login_page.dart';
import 'package:todo_flutter_training/ui/pages/auth/register/register_page.dart';
import 'package:todo_flutter_training/ui/widgets/auth/custom_auth_background.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
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
      customBackground: const CustomAuthBackground(),
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (prev, curr) =>
            prev.authType != curr.authType,
        builder: (context, state) {
          if (state.authType == AuthType.login) {
            return LoginPage();
          } else if (state.authType == AuthType.register) {
            return RegisterPage();
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
