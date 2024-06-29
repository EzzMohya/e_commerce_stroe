// ignore_for_file: library_private_types_in_public_api

import 'package:e_commerce_app/controller/HomeSreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenControllerImp> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: controller.navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) {
            return controller.pages.elementAt(controller.selectedIndex);
          },
        ),
        bottomNavigationBar: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) {
            return Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(7, 0),
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 15,
                    blurStyle: BlurStyle.normal)
              ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: NavigationBar(
                  backgroundColor: Colors.white,
                  indicatorColor: const Color.fromRGBO(0, 0, 0, 1),
                  destinations: controller.items,
                  selectedIndex: controller.selectedIndex,
                  onDestinationSelected: (value) {
                    controller.onPressed(value);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
