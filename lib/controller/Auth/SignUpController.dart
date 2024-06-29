import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/data/dataSource/remote/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpcontroller extends GetxController {
  sginUp();
  goToSignIn();
}

class SignUpcontrollerIm extends SignUpcontroller {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  statusrequest status = statusrequest.noun;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  SignupData signUp = SignupData(Get.find());
  List data = [];
  @override
  sginUp() async {
    var formdate = formstate.currentState;
    if (formdate!.validate()) {
      statusrequest.loading;
      var response = await signUp.postData(
          username.text, email.text, password.text, phone.text);
      status = handlingData(response);
      if (statusrequest.success == status) {
        print(response);
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(Approuts.login);
        } else {
          print(response);

          Get.defaultDialog(
              title: "Warning", middleText: "Phone Or Email Are Exist");
          status = statusrequest.failure;
        }
      } else {
        print(response);
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(Approuts.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
