import 'package:e_commerce_app/controller/Address/addController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/body_add_addreess.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Address",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: const BodyAddAddressView(),
    );
  }
}
