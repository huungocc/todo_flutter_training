import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_flutter_training/app.dart';
import 'package:todo_flutter_training/network/api_util.dart';
import 'package:todo_flutter_training/utils/local_notification_util.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await ApiUtil.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalNotifications.init();
  runApp(const MyApp());
}
