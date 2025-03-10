import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;
  final IconData icon;
  final Color iconColor;

  const NavButton({
    super.key,
    this.text,
    required this.onPressed,
    this.color,
    required this.iconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.black,
      child: Container(
        height: 46.0,
        width: 46.0,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
          size: 46 / 1.9,
        ),
      ),
    );
  }
}
