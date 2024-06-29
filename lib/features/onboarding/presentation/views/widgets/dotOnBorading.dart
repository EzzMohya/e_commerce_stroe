import 'package:e_commerce_app/controller/onBoardingContorller.dart';
import 'package:e_commerce_app/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotOnBoarding extends StatelessWidget {
  const DotOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingContorllerIm>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                boarding.length,
                (index) => AnimatedContainer(
                      decoration: BoxDecoration(
                          color: Colors.pink.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      height: 8,
                      width: controller.currntpage == index ? 16 : 9,
                      margin: const EdgeInsets.only(right: 5, bottom: 30),
                      duration: const Duration(milliseconds: 900),
                    ))
          ],
        );
      },
    );
  }
}
