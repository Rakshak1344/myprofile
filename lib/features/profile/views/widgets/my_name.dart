import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class MyName extends ResponsiveStatelessWidget {
  const MyName({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildMyName(context, fontSize: MediaQuery.of(context).size.width * 0.06);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildMyName(context,fontSize: MediaQuery.of(context).size.height * 0.06);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildMyName(context, fontSize: MediaQuery.of(context).size.height * 0.06);
  }

  Widget buildMyName(context, {double? fontSize}) {
    return AnimatedContainer(
      padding: EdgeInsets.all(10),
      duration: Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Rakshith Gajendra',
            style:  GoogleFonts.sacramento(
              fontSize: fontSize,
              fontStyle: FontStyle.italic,
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(seconds: 10),
            height: fontSize! /9,
            width: fontSize /9,
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
