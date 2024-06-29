import 'package:e_commerce_app/controller/ProductDetailController.dart';
import 'package:flutter/material.dart';

class ColorsProduct extends StatelessWidget {
  const ColorsProduct({
    super.key,
    required this.controller,
  });

  final ProductDetailControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            controller.Color.length,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: CircleAvatar(
                    backgroundColor: controller.Color[index],
                    radius: 25,
                  ),
                ))
      ],
    );
  }
}
