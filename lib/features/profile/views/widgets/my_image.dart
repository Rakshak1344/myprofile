import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class MyImage extends ResponsiveStatelessWidget {
  const MyImage({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: buildBoxDecoration(),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.height * 0.25,
      decoration: buildBoxDecoration(),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.height * 0.25,
      decoration: buildBoxDecoration(),
    );
  }

  BoxDecoration buildBoxDecoration() {
    const url =
        "https://pbs.twimg.com/profile_images/1146055708569292800/DaVWnQm3_400x400.jpg";

    return const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(url),
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    );
  }
}
