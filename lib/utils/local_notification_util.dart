import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    await _plugin.initialize(const InitializationSettings(android: android, iOS: ios));
  }

  static Future<void> show({
    required String id,
    String? title,
    String? body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'fcm_default_channel',            // channelId
      'General Notifications',          // channelName
      channelDescription: 'General Notifications', // channelDescription
      importance: Importance.high,      // Heads-up
      priority: Priority.high,          // Pop-up
      ticker: 'ticker',
      playSound: true,                  // phát âm thanh
      enableVibration: true,            // rung
      fullScreenIntent: false,          // true: full screen (call, alarm)
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );
    await _plugin.show(
      id.hashCode,
      title,
      body,
      const NotificationDetails(android: androidDetails, iOS: iosDetails),
    );
  }
}
