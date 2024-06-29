import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/FavoriteController.dart';
import 'package:e_commerce_app/controller/ItemController.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/core/function/TranslateDatebase.dart';
import 'package:e_commerce_app/data/model/itemsModel.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemList extends GetView<ItemsControllerImp> {
  final itemsModel item;
  const ItemList({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToProduct(item);
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
          ),
          Container(
            height: 155,
            decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 50,
            right: 0,
            child: Hero(
              tag: "${item.itemId}",
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesitem}/${item.itemImage}",
                  height: 150,
                  width: 150,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
              }))
        ],
      ),
    );
  }
}

// Stack(
//   children: [
//     InkWell(
//       onTap: () {
//         controller.goToProduct(itemsmodel);
//       },
//       child: Card(
//         surfaceTintColor: Colors.white,
//         color: Colors.white,
//         elevation: 0,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 6),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Hero(
//                 tag: "${itemsmodel.itemId}",
//                 child: CachedNetworkImage(
//                   imageUrl: "${AppLink.imagesitem}/${itemsmodel.itemImage}",
//                   height: 90,
//                 ),
//               ),
//               Text(
//                 "${TranslateDatabase(itemsmodel.itemNameAr, itemsmodel.itemName)}",
//                 style: const TextStyle(
//                     fontSize: 14, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "${TranslateDatabase(itemsmodel.itemDiscAr, itemsmodel.itemDisc)}",
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(fontSize: 12),
//                 textAlign: TextAlign.center,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Rating 4.5",
//                     textAlign: TextAlign.center,
//                   ),
//                   Row(
//                     children: [
//                       ...List.generate(
//                           5,
//                           (index) => const Icon(
//                                 Icons.star,
//                                 size: 14,
//                               ))
//                     ],
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${itemsmodel.ItemPriceDiscount}\$",
//                     style: const TextStyle(
//                         fontSize: 16,
//                         color: AppColor.primaryColor,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Row(
//                     children: [
//                       GetBuilder<FavoriteController>(
//                         builder: (controller) {
//                           return IconButton(
//                               visualDensity: VisualDensity.compact,
//                               onPressed: () {
//                                 if (controller
//                                         .isFavorite[itemsmodel.itemId] ==
//                                     1) {
//                                   controller.setFavorite(
//                                       itemsmodel.itemId, 0);
//                                   controller
//                                       .removeFavorite(itemsmodel.itemId);
//                                 } else {
//                                   controller.setFavorite(
//                                       itemsmodel.itemId, 1);
//                                   controller.addFavorite(itemsmodel.itemId);
//                                 }
//                               },
//                               icon: Icon(
//                                 controller.isFavorite[itemsmodel.itemId] ==
//                                         1
//                                     ? Icons.favorite
//                                     : Icons.favorite_border_outlined,
//                                 color: AppColor.primaryColor,
//                               ));
//                         },
//                       ),
//                       GetBuilder<FavoriteController>(
//                         builder: (controller) {
//                           return IconButton(
//                               visualDensity: VisualDensity.compact,
//                               onPressed: () {},
//                               icon: const Icon(
//                                 FluentIcons.cart_16_regular,
//                                 color: AppColor.primaryColor,
//                               ));
//                         },
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//     if (itemsmodel.itemDiscount != 0)
//       Positioned(
//         top: 4,
//         right: 5,
//         child: Container(
//           padding: const EdgeInsets.all(7),
//           decoration: const BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(30),
//                   bottomLeft: Radius.circular(30))),
//           child: Text(
//             "-${itemsmodel.itemDiscount}%",
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w800,
//                 fontSize: 17),
//           ),
//         ),
//       ),
//   ],
// );
