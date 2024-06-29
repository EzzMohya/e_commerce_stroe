import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UsersData usersData = UsersData(Get.find());
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List users = [];
  MyServices myServices = Get.find();
  statusrequest status = statusrequest.noun;
  String user = '';
  viewUser() async {
    status = statusrequest.loading;
    update();
    var response =
        await usersData.viewUser(myServices.sharedPreferences.getString("id")!);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == 'success') {
        users.addAll(response["data"]);
        name.text = users[0]["user_name"]!;
        email.text = users[0]["user_email"]!;
        phone.text = users[0]["user_phone"]!;

        status = statusrequest.success;
      } else {
        status = statusrequest.failure;
      }
    }
    update();
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(Approuts.login);
  }

  @override
  void onInit() {
    viewUser();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }
}
