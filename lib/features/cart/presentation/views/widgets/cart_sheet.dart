import 'package:e_commerce_app/controller/CartController.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartSheet extends StatelessWidget {
  const CartSheet({
    super.key, required this.controller,

  });
  final CartController  controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total (${controller.totalcountitems} item) :  ",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "\$${controller.getPriceTotal()}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            IconButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                    backgroundColor: WidgetStateColor.resolveWith(
                        (states) => AppColor.primaryColor)),
                onPressed: () {
                  Get.toNamed(Approuts.checkout, arguments: {
                    "couponid": controller.couponid ?? "0",
                    "priceorder": controller.priceorders,
                    "discountcoupon": controller.discountcoupon,
                    "cartModel":controller.data
                  });
                },
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Proceed to Checkout",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset("assets/images/arrowCheckout.svg")
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
