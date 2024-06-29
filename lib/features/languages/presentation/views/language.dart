import 'package:e_commerce_app/core/localization/LocalContorller.dart';
import 'package:e_commerce_app/features/languages/presentation/views/buttLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends GetView<LocalController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonLanguage(
              langCode: 'Arabic',
              onPressed: () {
                controller.changLang('ar');
              },
            ),
            ButtonLanguage(
              langCode: 'English',
              onPressed: () {
                controller.changLang('en');
              },
            ),
          ],
        ),
      ),
    );
  }
}
