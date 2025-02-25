import 'package:flutter/material.dart';

class SuccessCheck extends StatelessWidget {
  final Color? backgroundColor;
  final Color? checkColor;
  final double? size;

  const SuccessCheck({
    super.key,
    this.size = 80.0,
    this.backgroundColor = Colors.green,
    this.checkColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircleAvatar(
        backgroundColor: backgroundColor!.withOpacity(0.4),
        child: SizedBox(
          height: size! - 20.0,
          width: size! - 20.0,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            child: Center(
              child: Icon(
                Icons.check_rounded,
                color: checkColor,
                size: size! / 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
