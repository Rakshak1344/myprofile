import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/nav_button.dart';

class CareerInfo extends ResponsiveStatelessWidget {
  final String? navigateTo;
  final String title;
  final String subtitle;
  final IconData iconData;
  final String description;
  final List<String> images;

  const CareerInfo({
    super.key,
    this.navigateTo,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.description,
    required this.images,
  });

  @override
  Widget buildDesktop(BuildContext context) {
    return buildCareerInfo(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildCareerInfo(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildCareerInfo(context);
  }

  Widget buildCareerInfo(context) {
    return InkWell(
      onTap: navigateTo != null
          ? () => AppConfig.navigatorKey.currentContext?.goNamed(navigateTo!)
          : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconData),
              const SizedBox(height: 4),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStackedLogos(context),
                  if (navigateTo != null)
                    NavButton(
                      onPressed: () => AppConfig.navigatorKey.currentContext
                          ?.goNamed(navigateTo!),
                      iconColor: Theme.of(context).colorScheme.primary,
                      icon: Icons.arrow_forward_ios_rounded,
                    ),
                  // OutlinedButton(
                  //   style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                  //         visualDensity: VisualDensity.compact,
                  //       ),
                  //   onPressed: () => AppConfig.navigatorKey.currentContext
                  //       ?.goNamed(AppRouteName.career),
                  //   child: const Text('View More'),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStackedLogos(context) {
    return SizedBox(
      height: 60,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 60,
          width: (images.length * 42.0),
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(images.length, (index) {
              final double offset = (index - (images.length - 1) / 100) * 40.0;
              return Positioned(
                left: offset,
                child: buildLogoCircle(context, images[index]),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget buildLogoCircle(context, String image) {
    return Container(
      width: 45,
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
