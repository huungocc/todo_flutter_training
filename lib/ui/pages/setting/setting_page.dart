import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_cubit.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_state.dart';
import 'package:todo_flutter_training/ui/pages/setting/setting_navigator.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/utils/injection.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(authRepository: getIt<AuthRepository>()),
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
    context.read<AuthCubit>().logout();
  }

  void _backToLogin() {
    SettingNavigator(context: context).navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: S.of(context).settings,
      iconBackColor: AppColors.textWhite,
      colorAppBar: AppColors.todoPurple,
      isLightStatusBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            const SizedBox.shrink(),

            /// UserInfoCard
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: AppColors.todoPurple),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(radius: 40, backgroundColor: AppColors.gray1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      BaseTextLabel(
                        'Nguyen Van A',
                        style: AppTextStyle.blackS18W400,
                      ),
                      BaseTextLabel('nguyenvana@gmail.com'),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: AppColors.todoPurple),
                ],
              ),
            ),

            const SizedBox(height: 5),

            BaseTextLabel(
              S.of(context).settings,
              style: AppTextStyle.blackS16W500,
            ),

            BlocBuilder<AppSettingCubit, AppSettingState>(
              buildWhen: (prev, curr) => prev.language != curr.language,
              builder: (context, state) {
                final language = state.language;
                return BaseButton(
                  height: 50,
                  backgroundColor: AppColors.textWhite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: AppColors.textBlack),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseTextLabel(
                        S.of(context).change_language,
                        style: AppTextStyle.blackS16,
                      ),
                      BaseTextLabel(
                        language.flag,
                        style: AppTextStyle.blackS24W400,
                      ),
                    ],
                  ),
                  onTap: () {
                    _changeLanguage(language);
                  },
                );
              },
            ),

            /// Logout Listener
            BlocListener<AuthCubit, AuthState>(
              listenWhen: (prev, curr) =>
                  prev.logoutLoadStatus != curr.logoutLoadStatus,
              listener: (context, state) {
                if (state.logoutLoadStatus.isSuccess) {
                  _backToLogin();
                }
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: BlocConsumer<AuthCubit, AuthState>(
          listenWhen: (prev, curr) =>
              prev.logoutLoadStatus != curr.logoutLoadStatus,
          listener: (context, state) {
            if (state.logoutLoadStatus.isSuccess) {
              _backToLogin();
            }
          },
          buildWhen: (prev, curr) =>
              prev.logoutLoadStatus != curr.logoutLoadStatus,
          builder: (context, state) {
            return BaseButton(
              titleStyle: AppTextStyle.redS16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: AppColors.error),
              ),
              onTap: state.logoutLoadStatus.isLoading
                  ? null
                  : () {
                _onLogout();
              },
              child: state.logoutLoadStatus.isLoading
                  ? BaseLoading(
                size: AppDimens.iconSizeNormal,
                backgroundColor: AppColors.textBlack,
                valueColor: AppColors.textWhite,
              )
                  : BaseTextLabel(
                S.of(context).logout,
                style: AppTextStyle.redS16,
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}
