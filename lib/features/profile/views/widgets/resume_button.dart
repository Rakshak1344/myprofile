import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
      onPressed: _launchUrl,
    );
  }

  Future<void> _launchUrl() async {
    final resumeURL =
        "https://drive.google.com/file/d/1hdvW6dJhQcnc-8DRqUF4qFLRcR7L9Bw4/view";

    var url = Uri.parse(resumeURL);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
