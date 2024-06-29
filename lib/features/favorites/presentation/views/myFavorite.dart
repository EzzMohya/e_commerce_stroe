import 'package:e_commerce_app/controller/myFavoriteViewController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/appbarHome.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:e_commerce_app/features/favorites/presentation/views/widgets/myFavoriteList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteViewController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 65,
        leading: const BackWidget(),
        centerTitle: true,
      ),
      body: GetBuilder<MyFavoriteViewController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ListView(
              children: [
                customAppBar(
                  title: "Find Product",
                  searchOnPressed: () {},
                  onPressedFavorite: () {},
                  searchController: controller.myController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Wishlist",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                HandlingDataView(
                    statusRequest: controller.status,
                    widget: ListView(
                      shrinkWrap: true,
                      children: [
                        ...List.generate(controller.data.length, (int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MyFavoriteItemList(
                                itemsmodel: controller.data[index]),
                          );
                        })
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
