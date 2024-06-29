import 'package:e_commerce_app/controller/HomeController.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/core/function/TranslateDatebase.dart';
import 'package:e_commerce_app/data/model/categoriseModel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CateHome extends GetView<HomeControllerImp> {
  const CateHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: ListView.separated(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return categories(
            cate: CategoriesModel.fromJson(
              controller.categories[index],
            ),
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 11,
          );
        },
      ),
    );
  }
}

class categories extends GetView<HomeControllerImp> {
  final CategoriesModel cate;
  final int index;

  const categories({
    super.key,
    required this.cate,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToitems(
            controller.categories, index, cate.cateId.toString());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xffDCDCDC)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imagestatic}/${cate.cateImage}",
              height: 30,
              width: 30,
              fit: BoxFit.scaleDown,
              color: Colors.black,
            ),
          ),
          Text(
            " ${TranslateDatabase(cate.cateNameAr, cate.cateName)}",
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
