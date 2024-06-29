import 'package:e_commerce_app/controller/Auth/ForgetPassController.dart';
import 'package:e_commerce_app/core/function/valideinput.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/ButtonAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textFormAuth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassControllerIm controller = Get.put(ForgetPassControllerIm());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '14'.tr,
          style: context.textTheme.displayLarge!
              .copyWith(color: Colors.grey.shade500),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              TextBodyAuth(
                title: '27'.tr,
                color: Colors.black,
                size: 23,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 14,
              ),
              TextBodyAuth(
                title: '29'.tr,
                color: Colors.grey.shade500,
                size: 12,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormAuth(
                valid: (vaild) {
                  return validInput(vaild!, 5, 100, 'email');
                },
                icon: Icons.email_outlined,
                label: '18'.tr,
                hint: '12'.tr,
                mycontroller: controller.email,
              ),
              ButtonAuth(
                title: '30'.tr,
                onPressed: () {
                  controller.goToVerifyCode();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
