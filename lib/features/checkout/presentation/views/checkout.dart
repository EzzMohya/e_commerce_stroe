import 'package:e_commerce_app/Features/checkout/presentation/views/widgets/checkout_Preview.dart';
import 'package:e_commerce_app/Features/checkout/presentation/views/widgets/payment_method_body.dart';
import 'package:e_commerce_app/Features/checkout/presentation/views/widgets/stepper_address.dart';
import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/checkout_Stepper.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    List widgets = [
      StepperAddress(
        controller: controller,
      ),
      CheckoutPreview(
        controller: controller,
      ),
      PaymentMethodBodyView(
        controller: controller,
      ),
    ];
    return Scaffold(
        bottomNavigationBar:
            GetBuilder<CheckoutController>(builder: (controller) {
          return CheckoutButtons(
            controller: controller,
          );
        }),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: const BackWidget(),
          leadingWidth: 70,
          title: const Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CheckoutController>(builder: (controller) {
          return ListView(shrinkWrap: true, children: [
            CheckoutStepper(
              controller: controller,
            ),
            widgets[controller.activeStep]
          ]);
        }));
  }
}
