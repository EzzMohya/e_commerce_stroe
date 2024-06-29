import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({
    super.key,
    required this.controller,
  });
  final CheckoutController controller;
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: controller.activeStep,
      defaultStepBorderType: BorderType.normal,
      lineStyle: LineStyle(
        lineLength: MediaQuery.of(context).size.width * .2,
        lineType: LineType.normal,
        lineThickness: 2,
        lineSpace: 1,
        lineWidth: 10,
        unreachedLineType: LineType.normal,
      ),
      stepShape: StepShape.circle,
      stepBorderRadius: 15,
      borderThickness: 2,
      internalPadding: 4,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      stepRadius: 28,
      finishedStepBorderColor: AppColor.secondaryColor,
      finishedStepTextColor: AppColor.secondaryColor,
      finishedStepBackgroundColor: AppColor.secondaryColor,
      activeStepIconColor: AppColor.secondaryColor,
      showLoadingAnimation: false,
      steps: [
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: controller.activeStep >= 0 ? 1 : 0.3,
              child: SvgPicture.asset("assets/icons/location.svg"),
            ),
          ),
          customTitle: const Text(
            'Address',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: controller.activeStep >= 1 ? 1 : 0.3,
              child: SvgPicture.asset("assets/icons/eye.svg"),
            ),
          ),
          customTitle: const Text(
            'Preview',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: controller.activeStep >= 2 ? 1 : 0.3,
              child: SvgPicture.asset("assets/icons/wallet.svg"),
            ),
          ),
          customTitle: const Text(
            'Payment',
            textAlign: TextAlign.center,
          ),
        ),
      ],
      onStepReached: (index) {
        controller.activeStepper(index);
      },
    );
  }
}
