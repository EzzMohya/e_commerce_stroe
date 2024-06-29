import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? AddItems;
  final void Function()? RemoveItem;
  final String countItems;
  const PriceAndCountItems({
    super.key,
    this.controller,
    required this.AddItems,
    required this.RemoveItem,
    required this.countItems,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 90,
      decoration: ShapeDecoration(
          color: const Color(0xffEEEEEE),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: RemoveItem,
                child: const Icon(
                  CupertinoIcons.minus,
                  size: 13,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "$countItems",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: AddItems,
                child: const Icon(
                  CupertinoIcons.add,
                  size: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
