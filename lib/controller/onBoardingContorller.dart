// ignore_for_file: camel_case_types

import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class onBoardingContorller extends GetxController {
  next();
  onPageChanged(int index);
}

class onBoardingContorllerIm extends onBoardingContorller {
  late PageController pagecontoller;
  late int currntpage = 0;

  MyServices myServices = Get.find();
  @override
  next() {
    currntpage++;
    if (currntpage > boarding.length - 1) {
      myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(Approuts.login);
    } else {
      pagecontoller.animateToPage(currntpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currntpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontoller = PageController();
    super.onInit();
  }
}
