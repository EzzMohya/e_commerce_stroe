import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/data/dataSource/remote/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:e_commerce_app/core/services/services.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerIm extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  statusrequest status = statusrequest.noun;
  LoginData signIn = LoginData(Get.find());
  MyServices myServices = Get.find();
  bool showPass = true;
  showPassword() {
    showPass = !showPass;
    update();
  }

  @override
  login() async {
    var formdate = formstate.currentState;
    if (formdate!.validate()) {
      statusrequest.loading;
      var response = await signIn.postData(email.text, password.text);
      status = handlingData(response);
      if (statusrequest.success == status) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", '${response["data"]['user_id']}');
          myServices.sharedPreferences
              .setString("username", response["data"]['user_name']);
          myServices.sharedPreferences
              .setString("email", '${response["data"]['user_email']}');
          // myServices.sharedPreferences
          //     .setString("phone", response["data"]['user_phone']);
          String id = myServices.sharedPreferences.getString("id")!;

          myServices.sharedPreferences.setString("step", '2');
          // FirebaseMessaging.instance.subscribeToTopic("users");
          // FirebaseMessaging.instance.subscribeToTopic("users$id");
          Get.offNamed(Approuts.home);
        } else {
          print(response);

          Get.defaultDialog(title: "Warning", middleText: "User Are Not Exist");
          status = statusrequest.failure;
        }
      } else {
        print(response);
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(Approuts.signup);
  }

  goToForgetPassword() {
    Get.toNamed(Approuts.forgetPassword);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) => print(value));
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
