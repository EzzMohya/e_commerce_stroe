// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/Auth/LoginController.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/login_viiew_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerIm());

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '9'.tr,
            style: context.textTheme.displayLarge!
                .copyWith(color: Colors.grey.shade500),
          ),
          centerTitle: true,
        ),
        // ignore: deprecated_member_use
        body: const LoginViewBody());
  }
}
