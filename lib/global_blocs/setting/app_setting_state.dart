part of 'app_setting_cubit.dart';

class AppSettingState extends Equatable {
  final Language language;
  final AppThemeMode themeMode;

  const AppSettingState({
    this.language = AppConfigs.defaultLanguage,
    this.themeMode = AppThemeMode.system,
  });

  @override
  List<Object?> get props => [language, themeMode];

  AppSettingState copyWith({Language? language, AppThemeMode? themeMode}) {
    return AppSettingState(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
