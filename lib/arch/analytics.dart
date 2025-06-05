
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

// Your Google Analytics Measurement ID
const String gaMeasurementId = 'G-W83HDY3GLB'; // Replace with your actual ID

class AnalyticsNavigationObserver extends NavigatorObserver {
  void _sendPageView(String screenName) {
    // Ensure you're on the web before calling js.context.callMethod
    if (kIsWeb) { // kIsWeb is available from foundation.dart
      js.context.callMethod('gtag', [
        'event',
        'page_view',
        {
          'page_title': screenName, // Optional: You can set a custom title
          'page_location': '${Uri.base.origin}${Uri.base.fragment}', // Sends the full URL with hash
          'page_path': Uri.base.fragment, // Sends the path after the #
          'send_to': gaMeasurementId,
        }
      ]);
      print('GA: Sent page_view for $screenName, path: ${Uri.base.fragment}');
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      _sendPageView(route.settings.name!);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute?.settings.name != null) {
      _sendPageView(newRoute!.settings.name!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute?.settings.name != null) {
      // When popping, the "new" page is the previousRoute
      _sendPageView(previousRoute!.settings.name!);
    }
  }
}