import 'package:flutter/material.dart';

class GradientIconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final double fontSize;

  const GradientIconText({
    super.key,
    required this.text,
    required this.icon,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF5B4C2D), Color(0xFFC1A15F)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 2),
          Icon(icon, size: fontSize + 2, color: Colors.white),
        ],
      ),
    );
  }
}
