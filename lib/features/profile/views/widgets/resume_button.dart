import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/config/links.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/utils/url_launcher_extension.dart';

class ResumeButton extends ResponsiveStatelessWidget {
  const ResumeButton({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildButton(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildButton(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return SizedBox(child: buildButton(context));
  }

  Widget buildButton(context) {
    return OutlinedButton.icon(
      label: Text(
        "Resume",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      icon: Icon(MdiIcons.downloadBox),
      onPressed: Links.my.resume.launchURL,
    );
  }
}
