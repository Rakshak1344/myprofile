import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin ResponsiveMixin {


  Widget buildResponsive({
    required BuildContext context,
    required Widget Function() buildMobile,
    required Widget Function() buildTablet,
    required Widget Function() buildDesktop,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= 1200) {
          return buildDesktop();
        } else if (width >= 800) {
          return buildTablet();
        } else {
          return buildMobile();
        }
      },
    );
  }


  /// For Riverpod widgets (ConsumerWidget, ConsumerStatefulWidget)
  /// Check if this is needed
  Widget buildResponsiveWithRef({
    required BuildContext context,
    required WidgetRef ref,
    required Widget Function() buildMobile,
    required Widget Function() buildTablet,
    required Widget Function() buildDesktop,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= 1200) {
          return buildDesktop();
        } else if (width >= 800) {
          return buildTablet();
        } else {
          return buildMobile();
        }
      },
    );
  }
}
