import 'package:e_commerce_app/controller/orders/pending_controller.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:e_commerce_app/features/orders/presentation/views/widgets/orderslistcard.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
        backgroundColor: AppColor.secondaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const BackWidget(),
          backgroundColor: AppColor.secondaryColor,
          title: const Text('Orders'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.status,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersList(listdata: controller.data[index])),
                  )))),
        ));
  }
}
