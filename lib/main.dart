import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_flutter_training/app.dart';
import 'package:todo_flutter_training/utils/injection.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
