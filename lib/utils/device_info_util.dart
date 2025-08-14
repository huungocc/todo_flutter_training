import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:todo_flutter_training/generated/l10n.dart';

class DeviceInfoUtil {
  static Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? S.current.unknown;
    } else {
      return S.current.unsupported_platform;
    }
  }
}
