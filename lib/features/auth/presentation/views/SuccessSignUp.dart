import 'package:e_commerce_app/controller/Auth/SuccessController.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/ButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerIm controller = Get.put(SuccessSignUpControllerIm());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '32'.tr,
          style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 19,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          ),
          Text(
            '37'.tr,
            style: context.textTheme.headlineLarge,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '38'.tr,
            style: context.textTheme.bodySmall,
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ButtonAuth(
              title: '31'.tr,
              onPressed: () {
                controller.goToLogin();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
