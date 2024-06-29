import 'package:e_commerce_app/controller/orders/details_controller.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailController());
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackWidget(),
        leadingWidth: 70,
        backgroundColor: AppColor.secondaryColor,
        title: const Text("Order Detail"),
        centerTitle: true,
      ),
      body: Container(
          margin: const EdgeInsets.all(8),
          child: GetBuilder<OrderDetailController>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.status,
                widget: ListView(
                  children: [
                    Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                children: [
                                  const TableRow(children: [
                                    Text(
                                      'Item',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      'QTY',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      'Price',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                  ]),
                                  ...List.generate(
                                    controller.ordersDetail.length,
                                    (index) => TableRow(children: [
                                      Text(
                                        '${controller.ordersDetail[index].itemName}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '${controller.ordersDetail[index].countitems}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '${controller.ordersDetail[index].itemPrice}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    if (controller.orderModel.orderType == 0)
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const Icon(FluentIcons.location_12_filled),
                          title: Text(
                            "${controller.orderModel.addressCity}",
                            style: const TextStyle(
                                color: AppColor.primaryColor, fontSize: 18),
                          ),
                          subtitle:
                              Text("${controller.orderModel.addressStreet}"),
                        ),
                      )
                  ],
                ),
              );
            },
          )),
    );
  }
}
