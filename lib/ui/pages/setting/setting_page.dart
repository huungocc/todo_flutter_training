import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/setting/setting_cubit.dart';
import 'package:todo_flutter_training/ui/pages/setting/setting_navigator.dart';
import 'package:todo_flutter_training/ui/pages/setting/setting_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_dialog.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/ui/widgets/setting/setting_button.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingCubit(authRepository: getIt<AuthRepository>()),
      child: const _SettingBody(),
    );
  }
}

class _SettingBody extends StatefulWidget {
  const _SettingBody();

  @override
  State<_SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<_SettingBody> {
  void _changeLanguage(Language language) {
    context.read<AppSettingCubit>().changeLanguage(language: language.toggle);
  }

  void _onLogout() {
    BaseDialog.showNotifyDialog(
      message: S.of(context).are_you_sure_logout,
      onConfirm: () {
        context.read<SettingCubit>().logout();
      }
    );
  }

  void _backToLogin() {
    SettingNavigator(context: context).navigateToLogin();
  }

  void _navigateToChangePassword() {
    SettingNavigator(context: context).navigateToChangePassword();
  }

  void _navigateToChangeInfo() {
    SettingNavigator(context: context).navigateToChangeInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: S.of(context).account,
      iconBackColor: AppColors.textWhite,
      colorAppBar: AppColors.todoPurple,
      isLightStatusBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            /// UserInfoCard
            _buildUserInfoCard(),

            const SizedBox(height: 50),

            BaseTextLabel(
              S.of(context).settings,
              style: AppTextStyle.blackS16W600,
            ),

            const SizedBox(height: 20),

            /// ChangeInfoButton
            SettingButton(
              onTap: () => _navigateToChangeInfo(),
              icon: Icons.person,
              title: S.of(context).change_info,
            ),

            /// ChangePasswordButton
            SettingButton(
              onTap: () => _navigateToChangePassword(),
              icon: Icons.lock,
              title: S.of(context).change_password,
            ),

            /// ChangeLanguageButton
            _buildChangeLanguageButton(),

            /// LogoutButton
            _buildLogoutButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return Center(
      child: Column(
        spacing: 20,
        children: [
          const CircleAvatar(radius: 50, backgroundColor: AppColors.gray1),
          BaseTextLabel('Nguyen Van A', style: AppTextStyle.blackS18W400),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return BlocConsumer<SettingCubit, SettingState>(
      listenWhen: (prev, curr) =>
          prev.logoutLoadStatus != curr.logoutLoadStatus,
      listener: (context, state) {
        if (state.logoutLoadStatus.isSuccess) {
          _backToLogin();
        }
      },
      buildWhen: (prev, curr) => prev.logoutLoadStatus != curr.logoutLoadStatus,
      builder: (context, state) {
        return SettingButton(
          onTap: state.logoutLoadStatus.isLoading
              ? null
              : () {
                  _onLogout();
                },
          icon: Icons.logout,
          title: S.of(context).logout,
          action: state.logoutLoadStatus.isLoading
              ? const BaseLoading(size: 18,)
              : null,
        );
      },
    );
  }

  Widget _buildChangeLanguageButton() {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      buildWhen: (prev, curr) => prev.language != curr.language,
      builder: (context, state) {
        final language = state.language;
        return SettingButton(
          icon: Icons.language,
          title: S.of(context).change_language,
          onTap: () => _changeLanguage(language),
          action: BaseTextLabel(
            language.flag,
            style: AppTextStyle.blackS16W400,
          ),
        );
      },
    );
  }
}
