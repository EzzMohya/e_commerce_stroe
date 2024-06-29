// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/HomeController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/data/model/itemsModel.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/appbarHome.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cateHome.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/newArrival.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/titleHome.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/topSelling.dart';
import 'package:e_commerce_app/features/offers/presentation/views/offers.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            GetBuilder<HomeControllerImp>(
              builder: (controller) {
                return customAppBar(
                  title: "Search...",
                  searchOnPressed: () {
                    controller.onSearch();
                  },
                  onChanged: (value) {
                    controller.checkSearch(value);
                  },
                  onPressedFavorite: () {
                    Get.toNamed(Approuts.myfavorite);
                  },
                  searchController: controller.myController,
                );
              },
            ),
            const SizedBox(
              height: 14,
            ),
            HandlingDataView(
              statusRequest: controller.status,
              widget: !controller.isSearch
                  ? ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const titleHome(
                          title: "Categories",
                        ),
                        const CateHome(),
                        const Offers(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const titleHome(
                              title: "New Arrivals",
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "View All",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ))
                          ],
                        ),
                        controller.items.isNotEmpty
                            ? const NewArrival()
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const titleHome(
                              title: "Top Selling",
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "View All",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ))
                          ],
                        ),
                        controller.items.isNotEmpty
                            ? const TopSelling()
                            : Container(),
                      ],
                    )
                  : ListItemSearch(
                      listData: controller.searchItemList,
                      controller: controller,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItemSearch extends StatelessWidget {
  final List<itemsModel> listData;

  final HomeControllerImp controller;
  const ListItemSearch({
    super.key,
    required this.listData,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProduct(listData[index]);
          },
          child: Card(
              surfaceTintColor: Colors.white,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Hero(
                            tag: "${listData[index].itemId}",
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imagesitem}/${listData[index].itemImage}",
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${listData[index].itemName}",
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            "${listData[index].itemPrice}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FluentIcons.cart_16_filled,
                            color: AppColor.primaryColor,
                          )))
                ],
              )),
        );
      },
    );
  }
}
