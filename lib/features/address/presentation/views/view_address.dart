
import 'package:e_commerce_app/controller/Address/viewController.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/features/address/presentation/views/widgets/body_view_address.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 65,
          leading: const BackWidget(),
          centerTitle: true,
          title: const Text(
            "Your Addresses",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            controller.goToAdd();
          },
          child: const Icon(
            FluentIcons.add_12_filled,
            color: Colors.white,
          ),
        ),
        body: const BodyViewAddress());
  }
}
