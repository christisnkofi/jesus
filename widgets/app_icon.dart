import 'package:flutter/material.dart';
import 'package:gospela1/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color BackgroundColor;
  final Color iconColor;
  final double iconSize;
  final double size;
  AppIcon(
      {Key? key,
      required this.icon,
      this.BackgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40,
      this.iconSize = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: BackgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
