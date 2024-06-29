import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/core/constant/decoration.dart';
import 'package:e_commerce_app/data/model/addressModel.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddressCheckout extends StatelessWidget {
  const AddressCheckout({
    super.key,
    required this.addressModel,
    this.index,
  });
  final AddressModel addressModel;
  final index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.chooseShippingAddress(
              index.toString(), addressModel.addressId.toString());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          decoration: ContainerStyle.decoration,
          child: ListTile(
            visualDensity: VisualDensity.compact,
            leading: const Icon(FluentIcons.location_12_filled),
            title: Text(
              "${addressModel.addressName}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            trailing: controller.addressIndex == index.toString()
                ? SvgPicture.asset(
                    "assets/icons/check.svg",
                    fit: BoxFit.scaleDown,
                  )
                : null,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "City : ${addressModel.addressCity}  ",
                ),
                Text(
                  "Street : ${addressModel.addressStreet}  ",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
