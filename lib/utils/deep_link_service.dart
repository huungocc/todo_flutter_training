import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class DeepLinkService {
  static final DeepLinkService _instance = DeepLinkService._internal();
  factory DeepLinkService() => _instance;
  DeepLinkService._internal();

  late final AppLinks _appLinks;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    _appLinks = AppLinks();

    // Initial link (cold start)
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _handleUri(initialLink);
    }

    // Runtime link
    _appLinks.uriLinkStream.listen((uri) {
      _handleUri(uri);
    });
  }

  void _handleUri(Uri uri) {
    final context = NavigationConfig.context;
    if (context == null) return;

    switch (uri.host) {
      case "login-callback":
        context.go(AppRouter.setting);
        break;
      default:
        break;
    }
  }
}
