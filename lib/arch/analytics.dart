import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

// Your Google Analytics Measurement ID
const String gaMeasurementId = 'G-W83HDY3GLB'; // Replace with your actual ID

// 1. Define the gtag function using js_interop
@JS('gtag') // Assumes 'gtag' is a global function on the window object
external void gtag(JSString command, JSString eventName, JSObject parameters);

// 2. Helper extension to convert Dart Map to JSObject (as we discussed)
extension MapToJSObject on Map<String, dynamic> {
  JSObject get toJS {
    final jsObject = JSObject();
    forEach((key, value) {
      final jsKey = key.toJS; // dart:js_interop extension
      if (value is String) {
        jsObject.setProperty(jsKey, value.toJS);
      } else if (value is num) {
        jsObject.setProperty(jsKey, value.toJS);
      } else if (value is bool) {
        jsObject.setProperty(jsKey, value.toJS);
      } else if (value == null) {
        jsObject.setProperty(jsKey, null);
      }
      // Add more types like List (value.toJSArray()) or nested Maps if needed
    });
    return jsObject;
  }
}

class AnalyticsNavigationObserver extends NavigatorObserver {
  void _sendPageView(String screenName) {
    if (kIsWeb) {
      // Create the parameters Dart Map
      final paramsMap = {
        'page_title': screenName,
        'page_location': '${Uri.base.origin}${Uri.base.fragment}',
        'page_path': Uri.base.fragment.isEmpty ? '/' : Uri.base.fragment, // Handle empty fragment for root
        'send_to': gaMeasurementId,
      };

      // 3. Call the external gtag function directly with converted parameters
      gtag(
          'event'.toJS,          // Convert Dart String to JSString
          'page_view'.toJS,      // Convert Dart String to JSString
          paramsMap.toJS         // Convert Dart Map to JSObject using our extension
      );

      print('GA (js_interop): Sent page_view for $screenName, path: ${Uri.base.fragment.isEmpty ? '/' : Uri.base.fragment}');
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
