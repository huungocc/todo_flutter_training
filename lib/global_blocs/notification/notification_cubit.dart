import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/global_blocs/notification/notification_state.dart';
import 'package:todo_flutter_training/repository/notification_repository.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _repository;
  StreamSubscription? _foregroundSub;
  StreamSubscription? _openedSub;

  NotificationCubit(this._repository) : super(const NotificationState());

  Future<void> initialize() async {
    await _repository.init();
    final token = await _repository.getToken();
    print('Token: $token');

    // Emit Notification cho Local Notification xử lí (foreground)
    _foregroundSub = _repository.onMessage().listen((n) => emit(state.copyWith(notification: n)));

    // Emit Notification cho xử lý khi Click => mở App
    // Nếu app mở từ background
    _openedSub = _repository.onMessageOpenedApp().listen((n) => emit(state.copyWith(notification: n)));

    // Nếu app mở từ khi đã terminated
    final initial = await _repository.getInitialMessage();
    if (initial != null) emit(state.copyWith(notification: initial));

    emit(state.copyWith(isInitialized: true, token: token));
  }

  @override
  Future<void> close() {
    _foregroundSub?.cancel();
    _openedSub?.cancel();
    return super.close();
  }
}