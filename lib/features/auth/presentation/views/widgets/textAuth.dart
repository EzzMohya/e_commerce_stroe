import 'package:flutter/material.dart';

class TextBodyAuth extends StatelessWidget {
  const TextBodyAuth({
    super.key,
    required this.title,
    required this.color,
    required this.size,
    required this.fontWeight,
  });
  final String title;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}
