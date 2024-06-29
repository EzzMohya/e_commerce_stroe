import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
    this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.controllerCoupon,
                  decoration: InputDecoration(
                      hintText: "Coupon code",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20)),
                ),
              )),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                controller.checkCoupon();
              },
              child: Container(
                height: 30,
                width: 60,
                margin: const EdgeInsets.only(right: 10),
                decoration: ShapeDecoration(
                  color: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                child: const Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
