
import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/address_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class StepperAddress extends StatelessWidget {
  const StepperAddress({super.key, required this.controller});
  final CheckoutController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<CheckoutController>(
            builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.status,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.dataaddress.length,
                    itemBuilder: (context, index) {
                      return AddressCheckout(
                        addressModel: controller.dataaddress[index],
                        index: index,
                      );
                    },
                  ));
            },
          ),
          TextButton(
            onPressed: () {},
            style: const ButtonStyle(
              visualDensity: VisualDensity.compact,
              backgroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/icons/add.svg"),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

