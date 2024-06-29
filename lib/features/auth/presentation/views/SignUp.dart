// ignore_for_file: deprecated_member_use

import 'package:e_commerce_app/controller/Auth/SignUpController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/function/AlertExit.dart';
import 'package:e_commerce_app/core/function/valideinput.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/ButtonAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/TextSignUp.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textFormAuth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() {
      return SignUpcontrollerIm();
    }, fenix: true);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '17'.tr,
            style: context.textTheme.displayLarge!
                .copyWith(color: Colors.grey.shade500),
          ),
          centerTitle: true,
        ),
        body: WillPopScope(
            onWillPop: AlertExitApp,
            child: GetBuilder<SignUpcontrollerIm>(
              builder: (controller) {
                return HandlingDataRequest(
                    statusRequest: controller.status,
                    widget: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
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
                              title: '24'.tr,
                              color: Colors.grey.shade500,
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormAuth(
                              keyboardType: TextInputType.name,
                              valid: (vaild) {
                                return validInput(vaild!, 5, 20, 'username');
                              },
                              icon: Icons.person_2_outlined,
                              label: '20'.tr,
                              hint: '23'.tr,
                              mycontroller: controller.username,
                            ),
                            TextFormAuth(
                              keyboardType: TextInputType.emailAddress,
                              icon: Icons.email_outlined,
                              label: '18'.tr,
                              hint: '12'.tr,
                              mycontroller: controller.email,
                              valid: (vaild) {
                                return validInput(vaild!, 5, 30, 'email');
                              },
                            ),
                            TextFormAuth(
                              keyboardType: TextInputType.phone,
                              icon: Icons.phone_outlined,
                              label: '21'.tr,
                              hint: '22'.tr,
                              mycontroller: controller.phone,
                              valid: (vaild) {
                                return validInput(vaild!, 5, 15, 'phone');
                              },
                            ),
                            TextFormAuth(
                              secure: true,
                              icon: Icons.lock_outline,
                              label: '19'.tr,
                              hint: '13'.tr,
                              mycontroller: controller.password,
                              valid: (vaild) {
                                return validInput(vaild!, 5, 20, 'password');
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ButtonAuth(
                              title: '17'.tr,
                              onPressed: () {
                                controller.sginUp();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextSignUp(
                              titleone: '25'.tr,
                              titletow: '26'.tr,
                              onTap: () {
                                controller.goToSignIn();
                              },
                            )
                          ],
                        ),
                      ),
                    ));
              },
            )));
  }
}
