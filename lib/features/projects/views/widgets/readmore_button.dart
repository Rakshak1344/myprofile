import 'package:flutter/material.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/navigation/routes/app_route_name.dart';
import 'package:go_router/go_router.dart';

class ReadmoreButton extends ResponsiveStatelessWidget {
  final String slug;

  const ReadmoreButton({super.key, required this.slug});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildReadmoreButton(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildReadmoreButton(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildReadmoreButton(context);
  }

  Widget buildReadmoreButton(context) {
    return OutlinedButton.icon(
      label: Text("Read more", style: Theme.of(context).textTheme.bodySmall),
      icon: const Icon(Icons.read_more_rounded),
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            visualDensity: VisualDensity.compact,
          ),
      onPressed: () {
        AppConfig.navigatorKey.currentContext?.goNamed(
          AppRouteName.projectDetails,
          pathParameters: {'slug': slug},
        );
      },
    );
  }
}
