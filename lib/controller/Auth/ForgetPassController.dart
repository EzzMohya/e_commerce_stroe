import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPassController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgetPassControllerIm extends ForgetPassController {
  late TextEditingController email;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  checkEmail() {
    var formdate = formstate.currentState;
    if (formdate!.validate()) {
    } else {}
  }

  @override
  goToVerifyCode() {
    Get.offAllNamed(Approuts.verifyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
