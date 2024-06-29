import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class ButtonLanguage extends StatelessWidget {
  const ButtonLanguage({
    super.key,
    this.langCode,
    this.onPressed,
  });
  final langCode;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.symmetric(
                      horizontal: 50,
                    )),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => AppColor.primaryColor)),
        onPressed: onPressed,
        child: Text(
          langCode,
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w800),
        ));
  }
}
