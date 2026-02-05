flutter pub get
dart run intl_utils:generate
dart run build_runner build --delete-conflicting-outputs
dart format --set-exit-if-changed $(find lib -name "*.dart" -not -path "lib/generated/*")
flutter analyze