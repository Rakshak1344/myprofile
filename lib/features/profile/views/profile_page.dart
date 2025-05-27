import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/features/contact/contact_page.dart';
import 'package:profile/features/profile/views/components/about_me.dart';
import 'package:profile/features/profile/views/components/explore_my_experience.dart';
import 'package:profile/features/profile/views/widgets/built_responsive_flutter.dart';
import 'package:profile/features/profile/views/widgets/horizontal_line.dart';
import 'package:profile/features/projects/views/widgets/projects_list_widget.dart';
import 'components/profile_info.dart';

class ProfilePage extends ResponsiveConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ResponsiveConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ResponsiveConsumerState<ProfilePage> {
  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return buildBody(context);
  }

  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return buildBody(context);
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedPadding(
        duration: const Duration(seconds: 2),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1 / 2,
            vertical: MediaQuery.of(context).size.height * 0.1 / 1),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProfileInfo(),

            SizedBox(height: 40),
            ProjectsListWidget(isPreview: true),

            SizedBox(height: 40),
            AboutMe(),

            SizedBox(height: 40),
            ExploreMyExperience(),

            SizedBox(height: 20),
            ContactPage(),

            SizedBox(height: 20),
            HorizontalLine(),

            SizedBox(height: 20),
            BuiltResponsiveFlutter(),
            // ProjectHeaderName(),
            // SizedBox(height: 20),
            // GridViewProjectCards(),
          ],
        ),
      ),
    );
  }
}
