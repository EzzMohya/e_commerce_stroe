import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class TextSignUp extends StatelessWidget {
  const TextSignUp({
    super.key,
    this.onTap,
    required this.titleone,
    required this.titletow,
  });
  final String titleone;
  final String titletow;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleone,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            titletow,
            style: const TextStyle(
                color: AppColor.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
