import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/FavoriteController.dart';
import 'package:e_commerce_app/controller/HomeController.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/core/function/TranslateDatebase.dart';
import 'package:e_commerce_app/data/model/itemsModel.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrival extends GetView<HomeControllerImp> {
  const NewArrival({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.newArrival.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ArrivalItems(
              item: itemsModel.fromJson(controller.newArrival[i]),
            ),
          );
        },
      ),
    );
  }
}

class ArrivalItems extends StatelessWidget {
  const ArrivalItems({
    super.key,
    required this.item,
  });
  final itemsModel item;

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());

    return Stack(
      children: [
        Container(
          height: 155,
          width: 150,
          decoration: BoxDecoration(
              color: const Color(0xffDADADA),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          top: 5,
          left: 0,
          right: 0,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imagesitem}/${item.itemImage}",
              height: 130,
              width: 150,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "${TranslateDatabase(item.itemNameAr, item.itemName)}",
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$${item.itemPrice}",
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Positioned(
            top: 10,
            right: 10,
            child: GetBuilder<FavoriteController>(builder: (controller) {
              return GestureDetector(
                onTap: () {
                  if (controller.isFavorite[item.itemId] == 1) {
                    controller.setFavorite(item.itemId, 0);
                    controller.removeFavorite(item.itemId);
                  } else {
                    controller.setFavorite(item.itemId, 1);
                    controller.addFavorite(item.itemId);
                  }
                },
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: Icon(
                    controller.isFavorite[item.itemId] == 1
                        ? FluentIcons.heart_12_filled
                        : FluentIcons.heart_12_regular,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              );
            })),
      ],
    );
  }
}
