import 'package:e_commerce_app/controller/Auth/ResetPassController.dart';
import 'package:e_commerce_app/core/function/valideinput.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/ButtonAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textFormAuth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerIm contorller = Get.put(ResetPasswordControllerIm());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '39'.tr,
          style: context.textTheme.displayLarge!
              .copyWith(color: Colors.grey.shade500),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: contorller.formstate,
          child: ListView(
            children: [
              TextBodyAuth(
                title: '35'.tr,
                color: Colors.black,
                size: 23,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 14,
              ),
              TextBodyAuth(
                title: '34'.tr,
                color: Colors.grey.shade500,
                size: 12,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormAuth(
                valid: (vaild) {
                  return validInput(vaild!, 5, 100, 'password');
                },
                icon: Icons.lock_outline,
                label: 'Password',
                hint: 'Enter a new your password',
                mycontroller: contorller.password,
              ),
              TextFormAuth(
                valid: (vaild) {
                  return validInput(vaild!, 5, 100, 'password');
                },
                icon: Icons.lock_outline,
                label: 'Password',
                hint: 'Re-Enter your password',
                mycontroller: contorller.repassword,
              ),
              ButtonAuth(
                title: '33'.tr,
                onPressed: () {
                  contorller.goToSuccessReset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
