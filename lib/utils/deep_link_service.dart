import 'dart:async';
import 'package:app_links/app_links.dart';

class DeepLinkService {
  static final DeepLinkService _instance = DeepLinkService._internal();
  factory DeepLinkService() => _instance;
  DeepLinkService._internal();

  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _sub;
  Uri? _pendingUri;

  Future<void> init() async {
    _appLinks = AppLinks();

    _sub = _appLinks.uriLinkStream.listen((uri) {
      // Supabase xử lý login → chỉ lưu lại để UI dùng
      _pendingUri = uri;
    });

    // Deeplink khi app cold start
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _pendingUri = initialUri;
    }
  }

  Uri? consumePendingDeeplink() {
    final uri = _pendingUri;
    _pendingUri = null;
    return uri;
  }

  void dispose() {
    _sub?.cancel();
  }
}


