import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/features/profile/views/widgets/built_responsive_flutter.dart';
import 'profile_info.dart';
import '../../../arch/view/responsive_view.dart';
import '../../socials/views/social_info.dart';

class ProfilePage extends ResponsiveConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
        duration: Duration(seconds: 2),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1 / 2,
            vertical: MediaQuery.of(context).size.height * 0.1 / 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // NavHeader(),
            ProfileInfo(),
            SizedBox(height: 20),
            // ProjectHeaderName(),
            // SizedBox(height: 20),
            // GridViewProjectCards(),

          ],
        ),
      ),
    );
  }
}
