import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardCart extends StatelessWidget {
  const CardCart({
    super.key,
    required this.itemName,
    required this.price,
    required this.image,
    required this.widget,
  });
  final String itemName;
  final String price;
  final String image;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          height: 100,
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
                imageUrl: image,
                height: 80,
                width: 80,
              ),
            )),
        Positioned(
          top: 12,
          right: 110,
          left: 110,
          child: Text(
            itemName,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 25,
          left: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              widget
            ],
          ),
        ),
      ],
    );
  }
}
