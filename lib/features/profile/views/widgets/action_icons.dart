import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class ActionIcons extends ResponsiveStatelessWidget {
  const ActionIcons({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return allIcons();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return allIcons();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return allIcons();
  }

  Widget allIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "{",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.red, fontSize: 20),
        ),
        Icon(MdiIcons.coffee),
        Icon(MdiIcons.desktopClassic),
        Icon(MdiIcons.keyboard),
        Icon(MdiIcons.cellphone),
        Icon(Icons.flight),
        Text(
          "}",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.red, fontSize: 20),
        )
      ],
    );
  }
}
