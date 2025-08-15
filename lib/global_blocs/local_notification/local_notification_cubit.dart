import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/global_blocs/local_notification/local_notification_state.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/local_notification_repository.dart';

class LocalNotificationCubit extends Cubit<LocalNotificationState> {
  final LocalNotificationRepository _repository;

  LocalNotificationCubit(this._repository) : super(const LocalNotificationState());

  /// Khởi tạo notification plugin
  Future<void> initNotifications() async {
    try {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      await _repository.init();
      emit(state.copyWith(
        loadStatus: LoadStatus.success,
        successMessage: 'Notification initialized',
      ));
    } catch (e) {
      emit(state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: 'Init failed: $e',
      ));
    }
  }

  /// Lên lịch thông báo
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDateTime,
  }) async {
    try {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      await _repository.showScheduledNotification(
        id: id,
        title: title,
        body: body,
        scheduledDateTime: scheduledDateTime,
      );
      emit(state.copyWith(
        loadStatus: LoadStatus.success,
        successMessage: 'Notification scheduled',
      ));
    } catch (e) {
      emit(state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: 'Schedule failed: $e',
      ));
    }
  }

  /// Hủy một notification
  Future<void> cancelNotification(int id) async {
    try {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      await _repository.cancelNotification(id);
      emit(state.copyWith(
        loadStatus: LoadStatus.success,
        successMessage: 'Notification cancelled',
      ));
    } catch (e) {
      emit(state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: 'Cancel failed: $e',
      ));
    }
  }

  /// Hủy tất cả notification
  Future<void> cancelAllNotifications() async {
    try {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      await _repository.cancelAllScheduledNotifications();
      emit(state.copyWith(
        loadStatus: LoadStatus.success,
        successMessage: 'All notifications cancelled',
      ));
    } catch (e) {
      emit(state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: 'Cancel all failed: $e',
      ));
    }
  }
}
