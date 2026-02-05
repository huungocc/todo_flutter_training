import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/database/share_preferences_helper.dart';
import 'package:todo_flutter_training/models/enums/app_theme_mode.dart';
import 'package:todo_flutter_training/models/enums/language.dart';

part 'app_setting_state.dart';

@injectable
class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit() : super(const AppSettingState()) {
    _initializeLanguage();
    _initializeThemeMode();
  }

  Future<void> _initializeLanguage() async {
    final currentLanguage = await SharedPreferencesHelper.getCurrentLanguage();
    emit(state.copyWith(language: currentLanguage));
  }

  void changeLanguage({required Language language}) async {
    await SharedPreferencesHelper.setCurrentLanguage(language);
    emit(state.copyWith(language: language));
  }

  Future<void> _initializeThemeMode() async {
    final currentThemeMode =
        await SharedPreferencesHelper.getCurrentThemeMode();
    emit(state.copyWith(themeMode: currentThemeMode));
  }

  void changeThemeMode(AppThemeMode themeMode) async {
    await SharedPreferencesHelper.setCurrentThemeMode(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }
}
