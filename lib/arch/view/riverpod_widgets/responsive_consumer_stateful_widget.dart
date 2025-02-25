import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/arch/view/responsive_mixin.dart';

abstract class ResponsiveConsumerStatefulWidget extends ConsumerStatefulWidget {
  const ResponsiveConsumerStatefulWidget({Key? key}) : super(key: key);

  @override
  ResponsiveConsumerState createState();
}

abstract class ResponsiveConsumerState<
        T extends ResponsiveConsumerStatefulWidget> extends ConsumerState<T>
    with ResponsiveMixin {
  Widget buildMobile(BuildContext context, WidgetRef ref);

  Widget buildTablet(BuildContext context, WidgetRef ref);

  Widget buildDesktop(BuildContext context, WidgetRef ref);

  @override
  Widget build(BuildContext context) {
    return buildResponsive(
      context: context,
      buildMobile: () => buildMobile(context, ref),
      buildTablet: () => buildTablet(context, ref),
      buildDesktop: () => buildDesktop(context, ref),
    );
  }
}
