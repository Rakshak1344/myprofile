import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/arch/view/responsive_mixin.dart';

abstract class ResponsiveConsumerWidget extends ConsumerWidget
    with ResponsiveMixin {
  const ResponsiveConsumerWidget({Key? key}) : super(key: key);

  Widget buildMobile(BuildContext context, WidgetRef ref);

  Widget buildTablet(BuildContext context, WidgetRef ref);

  Widget buildDesktop(BuildContext context, WidgetRef ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return buildResponsive(
      context: context,
      buildMobile: () => buildMobile(context, ref),
      buildTablet: () => buildTablet(context, ref),
      buildDesktop: () => buildDesktop(context, ref),
    );
  }
}
