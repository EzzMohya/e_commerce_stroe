
import 'package:e_commerce_app/controller/Auth/LoginController.dart';
import 'package:e_commerce_app/core/function/valideinput.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/ButtonAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/LogoAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/TextSignUp.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textFormAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'textAuth.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });
  final LoginControllerIm controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formstate,
      child: ListView(
        children: [
          const LogoAuth(),
          TextBodyAuth(
            title: '10'.tr,
            color: Colors.black,
            size: 23,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: 14,
          ),
          TextBodyAuth(
            title: '11'.tr,
            color: Colors.grey.shade500,
            size: 12,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormAuth(
            keyboardType: TextInputType.emailAddress,
            valid: (vaild) {
              return validInput(vaild!, 5, 100, 'email');
            },
            icon: Icons.email_outlined,
            label: '18'.tr,
            hint: '12'.tr,
            mycontroller: controller.email,
          ),
          GetBuilder<LoginControllerIm>(builder: (controller) {
            return TextFormAuth(
              secure: controller.showPass,
              ontap: () {
                controller.showPassword();
              },
              valid: (vaild) {
                return validInput(vaild!, 3, 30, 'password');
              },
              icon: Icons.lock_outline,
              label: '19'.tr,
              hint: '13'.tr,
              mycontroller: controller.password,
            );
          }),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                controller.goToForgetPassword();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: TextBodyAuth(
                  color: Colors.grey,
                  title: '14'.tr,
                  size: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ButtonAuth(
            title: '15'.tr,
            onPressed: () {
              controller.login();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextSignUp(
            titleone: '16'.tr,
            titletow: '17'.tr,
            onTap: () {
              controller.goToSignUp();
            },
          )
        ],
      ),
    );
  }
}
