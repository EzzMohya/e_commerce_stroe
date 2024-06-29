import 'package:e_commerce_app/controller/onBoardingContorller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class buttonOnboarding extends GetView<onBoardingContorllerIm> {
  const buttonOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.symmetric(
                      horizontal: 80,
                    )),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => AppColor.primaryColor)),
        onPressed: () {
          controller.next();
        },
        child: Text(
          '8'.tr,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
        ));
  }
}
