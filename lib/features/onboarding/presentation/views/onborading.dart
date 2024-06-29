import 'package:e_commerce_app/controller/onBoardingContorller.dart';
import 'package:e_commerce_app/features/onboarding/presentation/views/widgets/buttonOnBoarding.dart';
import 'package:e_commerce_app/features/onboarding/presentation/views/widgets/dotOnBorading.dart';
import 'package:e_commerce_app/features/onboarding/presentation/views/widgets/pageviewOnBordaing.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingContorllerIm());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            flex: 5,
            child: pageviewOnBoarding(),
          ),
          Flexible(
              flex: 1,
              child: Column(
                children: [DotOnBoarding(), buttonOnboarding()],
              ))
        ],
      )),
    );
  }
}
