import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

class RGInitial extends ResponsiveStatelessWidget {
  const RGInitial({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildRGInitial(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildRGInitial(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildRGInitial(context);
  }

  Widget buildRGInitial(context, {double? fontSize}) {
    return AnimatedContainer(
      padding: EdgeInsets.all(10),
      duration: Duration(seconds: 3),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: AutoSizeText(
              'RG',
              style: GoogleFonts.sacramento(
                fontSize: fontSize ?? 27,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(seconds: 10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  void onTap() {
    AppConfig.navigatorKey.currentContext?.goNamed(AppRouteName.me);
  }
}
