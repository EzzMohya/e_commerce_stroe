import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changLang(String langcode) {
    Locale local = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    Get.updateLocale(local);
    Get.offNamed(Approuts.onboarding);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    Map map = {
      'ar': const Locale('ar'),
      'en': const Locale('en'),
    };
    language = map[sharedPrefLang] ?? Locale(Get.deviceLocale!.languageCode);
    super.onInit();
  }
}
