import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/utils/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => await getIt.init();