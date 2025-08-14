import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/global_blocs/notification/notification_state.dart';
import 'package:todo_flutter_training/repository/notification_repository.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _repository;

  NotificationCubit(this._repository) : super(const NotificationState());

  Future<void> initialize() async {
    await _repository.init();

    final token = await _repository.getToken();
    emit(state.copyWith(isInitialized: true, token: token));

    _repository.onMessage().listen((notification) {
      emit(state.copyWith(notification: notification));
    });

    _repository.onMessageOpenedApp().listen((notification) {
      emit(state.copyWith(notification: notification));
    });
  }
}