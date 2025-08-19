import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'local_notification_state.freezed.dart';

@freezed
abstract class LocalNotificationState with _$LocalNotificationState {
  const factory LocalNotificationState({
    @Default(LoadStatus.initial) LoadStatus loadStatus,
    String? errorMessage,
    String? successMessage,
  }) = _LocalNotificationState;
}
