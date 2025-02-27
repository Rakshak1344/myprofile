import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/profile/data/tech_experience_data.dart';

class ExploreMyExperience extends ResponsiveStatelessWidget {
  const ExploreMyExperience({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildExploreMyExperience();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildExploreMyExperience();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildExploreMyExperience();
  }

  Widget buildExploreMyExperience() {
    return Column(
      children: [
        TitleAndLine(preTitle: "Worked on these", title: "Tech"),
        SizedBox(height: 20),
        ExperienceContainer(),
      ],
    );
  }
}

class ExperienceContainer extends ResponsiveStatelessWidget {
  const ExperienceContainer({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildExperienceContainer(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildExperienceContainer(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildExperienceContainer(context);
  }

  Widget buildExperienceContainer(context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(16)),
      child: Wrap(
        children: TechExperienceData.stack.map((e) {
          return ExperienceTile(
            stack: e.name,
            experience: e.experienceLevel,
            iconUrl: e.assetUrl,
            iconData: e.iconData,
          );
        }).toList(),
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String stack;
  final String experience;
  final IconData? iconData;
  final String? iconUrl;

  const ExperienceTile({
    super.key,
    required this.stack,
    required this.experience,
    this.iconData,
    this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          if (iconUrl != null)
            buildAssetIcon(context)
          else if (iconData != null) ...[
            Icon(iconData, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stack,
                    style: Theme.of(context).textTheme.bodyMedium, maxLines: 1),
                Text(experience, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAssetIcon(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Image.asset(
        iconUrl!,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
