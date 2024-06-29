import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/myFavoriteViewController.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/core/function/TranslateDatebase.dart';
import 'package:e_commerce_app/data/model/myfavoriteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteItemList extends GetView<MyFavoriteViewController> {
  final MyFavoriteModel itemsmodel;
  const MyFavoriteItemList({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                        offset: const Offset(0, 7),
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 15,
                        blurStyle: BlurStyle.normal)
                  ],
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              height: 110,
            ),
            Positioned(
                top: 10,
                bottom: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesitem}/${itemsmodel.itemImage}",
                    height: 80,
                    width: 80,
                  ),
                )),
            Positioned(
              top: 12,
              right: 110,
              left: 110,
              child: Text(
                "${TranslateDatabase(itemsmodel.itemNameAr, itemsmodel.itemName)}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 12,
              right: 20,
              left: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsmodel.itemPrice}\$",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
        );
  }
}

// Card(
//     surfaceTintColor: Colors.white,
//     elevation: 7,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//     child: Padding(
//       padding: const EdgeInsets.all(6.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Hero(
//             tag: "${itemsmodel.itemId}",
//             child: CachedNetworkImage(
//               imageUrl: "${AppLink.imagesitem}/${itemsmodel.itemImage}",
//               height: 90,
//             ),
//           ),
//           Text(
//             "${TranslateDatabase(itemsmodel.itemNameAr, itemsmodel.itemName)}",
//             style:
//                 const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             "${TranslateDatabase(itemsmodel.itemDiscAr, itemsmodel.itemDisc)}",
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Rating 4.5",
//                 textAlign: TextAlign.center,
//               ),
//               Row(
//                 children: [
//                   ...List.generate(
//                       5,
//                       (index) => const Icon(
//                             Icons.star,
//                             size: 14,
//                           ))
//                 ],
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "${itemsmodel.itemPrice}\$",
//                 style: const TextStyle(
//                     fontSize: 16,
//                     color: AppColor.primaryColor,
//                     fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                   visualDensity: VisualDensity.compact,
//                   onPressed: () {
//                     controller.removeFavorite(itemsmodel.favoriteId!);
//                   },
//                   icon: const Icon(
//                     FluentIcons.delete_12_regular,
//                     color: AppColor.primaryColor,
//                   ))
//             ],
//           )
//         ],
//       ),
//     ),
//   ),
