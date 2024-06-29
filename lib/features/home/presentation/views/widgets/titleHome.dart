import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class titleHome extends StatelessWidget {
  const titleHome({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.primaryColor),
      ),
    );
  }
}
