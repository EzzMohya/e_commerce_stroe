import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutButtons extends StatelessWidget {
  const CheckoutButtons({
    super.key,
    required this.controller,
  });
  final CheckoutController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Visibility(
        visible: controller.activeStep != 0 ? false : true,
        replacement: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (controller.activeStep == 2) {
                    controller.activeStepper(1);
                  } else if (controller.activeStep == 1) {
                    controller.activeStepper(0);
                  }
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColor.primaryColor,
                  child: SvgPicture.asset("assets/icons/Left.svg"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (controller.activeStep == 0) {
                    controller.activeStepper(1);
                  } else if (controller.activeStep == 1) {
                    controller.activeStepper(2);
                  }
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColor.primaryColor,
                  child: SvgPicture.asset("assets/icons/Right.svg"),
                ),
              ),
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {
            if (controller.activeStep == 0) {
              controller.activeStepper(1);
            } else if (controller.activeStep == 1) {
              controller.activeStepper(2);
            }
          },
          child: Container(
            decoration: ContainerStyle.decorationBlack,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Proceed to Preview",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset("assets/images/arrowCheckout.svg")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
