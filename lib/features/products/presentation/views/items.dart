import 'package:e_commerce_app/controller/FavoriteController.dart';
import 'package:e_commerce_app/controller/ItemController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/data/model/itemsModel.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/itemsCate.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/listCategoriesItems.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController ControllerFav = Get.put(FavoriteController());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 70,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              'assets/images/arrow.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                // customAppBar(
                //   title: 'Find Products',
                // ),
                const SizedBox(
                  height: 10,
                ),
                const ListListCategoriesItems(),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<ItemsControllerImp>(builder: (controller) {
                  return HandlingDataView(
                      statusRequest: controller.status,
                      widget: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            ControllerFav.isFavorite[controller.items[index]
                                    ['item_id']] =
                                controller.items[index]['favroite'];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ItemList(
                                item: itemsModel
                                    .fromJson(controller.items[index]),
                              ),
                            );
                          }));
                })
              ],
            )));
  }
}
