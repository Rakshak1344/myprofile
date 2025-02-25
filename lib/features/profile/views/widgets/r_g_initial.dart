import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class RGInitial extends ResponsiveStatelessWidget {
  const RGInitial({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildRGInitial(fontSize: 52);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildRGInitial();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildRGInitial();
  }

  Widget buildRGInitial({double? fontSize}) {
    return AnimatedContainer(
      padding: EdgeInsets.all(10),
      duration: Duration(seconds: 3),
      child: Row(
        children: <Widget>[
          AutoSizeText(
            'RG',
            style: GoogleFonts.sacramento(
              fontSize: fontSize ?? 27,
              fontStyle: FontStyle.italic,
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(seconds: 10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
