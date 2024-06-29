// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/onBoardingContorller.dart';
import 'package:e_commerce_app/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class pageviewOnBoarding extends GetView<onBoardingContorllerIm> {
  const pageviewOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontoller,
      itemCount: boarding.length,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage(
                boarding[index].image!,
              ),
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              boarding[index].title!,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              boarding[index].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.grey.shade500),
            ),
          ],
        );
      },
    );
  }
}
