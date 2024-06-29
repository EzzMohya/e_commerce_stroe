import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: Approuts.home);
    }

    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: Approuts.login);
    }
    return null;
  }
}
