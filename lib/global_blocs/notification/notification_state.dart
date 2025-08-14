import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/entities/notification/notification_entity.dart';

part 'notification_state.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool isInitialized,
    String? token,
    NotificationEntity? notification,
  }) = _NotificationState;
}