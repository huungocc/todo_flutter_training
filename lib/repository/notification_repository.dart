import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:todo_flutter_training/models/entities/notification/notification_entity.dart';

abstract class NotificationRepository {
  Future<void> init();
  Future<String?> getToken();
  Stream<NotificationEntity> onMessage();
  Stream<NotificationEntity> onMessageOpenedApp();
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

  @override
  Stream<NotificationEntity> onMessage() {
    return FirebaseMessaging.onMessage.map((message) {
      return NotificationEntity(
        title: message.notification?.title,
        body: message.notification?.body,
        data: message.data,
      );
    });
  }

  @override
  Stream<NotificationEntity> onMessageOpenedApp() {
    return FirebaseMessaging.onMessageOpenedApp.map((message) {
      return NotificationEntity(
        title: message.notification?.title,
        body: message.notification?.body,
        data: message.data,
      );
    });
  }
}