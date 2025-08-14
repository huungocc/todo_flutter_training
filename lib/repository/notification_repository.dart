import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:todo_flutter_training/models/entities/notification/notification_entity.dart';

abstract class NotificationRepository {
  Future<void> init();

  Future<String?> getToken();

  Stream<NotificationEntity> onMessage();

  Stream<NotificationEntity> onMessageOpenedApp();

  Future<NotificationEntity?> getInitialMessage();

}

class NotificationRepositoryImpl implements NotificationRepository {
  final FirebaseMessaging _messaging;

  NotificationRepositoryImpl(this._messaging);

  @override
  Future<void> init() async {
    await _messaging.requestPermission();
  }

  @override
  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  NotificationEntity _map(RemoteMessage m) => NotificationEntity(
    title: m.notification?.title,
    body: m.notification?.body,
    data: m.data,
  );

  @override
  Stream<NotificationEntity> onMessage() =>
      FirebaseMessaging.onMessage.map(_map);

  @override
  Stream<NotificationEntity> onMessageOpenedApp() =>
      FirebaseMessaging.onMessageOpenedApp.map(_map);

  @override
  Future<NotificationEntity?> getInitialMessage() async {
    final msg = await _messaging.getInitialMessage();
    return msg == null ? null : _map(msg);
  }
}