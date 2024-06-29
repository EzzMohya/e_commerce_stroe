import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/core/function/TranslateDatebase.dart';
import 'package:flutter/material.dart';

class CheckoutPreviewList extends StatelessWidget {
  const CheckoutPreviewList({
    super.key,
    required this.controller,
    required this.index,
  });

  final CheckoutController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          height: 90,
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
                imageUrl:
                    "${AppLink.imagesitem}/${controller.data[index].itemImage}",
                height: 70,
                width: 70,
              ),
            )),
        Positioned(
          top: 12,
          right: 110,
          left: 110,
          child: Text(
            "${TranslateDatabase(controller.data[index].itemNameAr, controller.data[index].itemName)}",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 33,
          right: 50,
          left: 110,
          child: Text(
            "${TranslateDatabase(controller.data[index].itemDiscAr, controller.data[index].itemDisc)}",
            maxLines: 1,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: FontWeight.normal),
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
                "${controller.data[index].itemPrice}\$",
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
              Text(
                "x${controller.data[index].countitems}",
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
