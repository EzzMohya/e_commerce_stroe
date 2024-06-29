import 'package:e_commerce_app/controller/orders/pending_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/data/model/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrderModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
          decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                    offset: const Offset(0, 7),
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 15,
                    blurStyle: BlurStyle.normal)
              ],
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : ${listdata.orderId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy.parse(listdata.orderCreate.toString()).fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.orderType!.toString())}"),
              Text("Order Price : ${listdata.orderPrice} \$"),
              Text("Delivery Price : ${listdata.orderPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.orderPaymentmethod!.toString())} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.orderStatus!.toString())} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price :  \$${listdata.orderTotalprice} ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Get.toNamed(Approuts.orderDetail,
                          arguments: {"listOrder": listdata});
                    },
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    child: const Text(
                      "Details",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.orderStatus! == "0")
                    MaterialButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.orderId!.toString());
                      },
                      color: AppColor.primaryColor,
                      textColor: Colors.black,
                      child: const Text("Delete"),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
