// ignore_for_file: file_names

import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessReset();
}

class ResetPasswordControllerIm extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  resetPassword() {
    var formdate = formstate.currentState;
    if (formdate!.validate()) {
    } else {}
  }

  @override
  goToSuccessReset() {
    Get.offAllNamed(Approuts.successReset);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
