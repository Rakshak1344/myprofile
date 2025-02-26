import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color? color;
  final IconData icon;
  final Color iconColor;

  const NavButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.color,
    required this.iconColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.black,
      child: Container(
        height: 46.0,
        width: 46.0,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.all(10),
        child: Icon(icon, color: iconColor, size: 46 / 1.9),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
      ),
    );
  }
}
