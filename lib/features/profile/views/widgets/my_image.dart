import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/resources/resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyImage extends ResponsiveConsumerStatefulWidget {
  const MyImage({super.key});

  @override
  ResponsiveConsumerState<MyImage> createState() => _MyImageState();
}

class _MyImageState extends ResponsiveConsumerState<MyImage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: buildBoxDecoration(),
      child: buildMyImage(),
    );
  }

  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.height * 0.25,
      decoration: buildBoxDecoration(),
      child: buildMyImage(),
    );
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.height * 0.25,
      decoration: buildBoxDecoration(),
      child: buildMyImage(),
    );
  }

  Decoration buildBoxDecoration() {
    // const url =
    //     "https://pbs.twimg.com/profile_images/1146055708569292800/DaVWnQm3_400x400.jpg";

    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget buildMyImage() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Lottie.asset(
        MyLottie.animation,
        controller: _controller,
        fit: BoxFit.fill,
        repeat: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward()
            ..repeat();
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
