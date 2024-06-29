import 'package:e_commerce_app/controller/Auth/VeriCodeController.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerIm contorller = Get.put(VerifyCodeControllerIm());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verification Code',
          style: context.textTheme.displayLarge!
              .copyWith(color: Colors.grey.shade500),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ListView(
          children: [
            const TextBodyAuth(
              title: 'Check Code',
              color: Colors.black,
              size: 23,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 14,
            ),
            TextBodyAuth(
              title:
                  'Sign Up With Your Email And Password OR \n Continue With Social Media',
              color: Colors.grey.shade500,
              size: 12,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              fieldWidth: 50,
              borderColor: const Color(0xFF512DA8),
              focusedBorderColor: AppColor.primaryColor,
              clearText: false,
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                contorller.goToResetPassword();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
