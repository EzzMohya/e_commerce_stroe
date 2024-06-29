import 'package:e_commerce_app/controller/ItemController.dart';
import 'package:e_commerce_app/core/function/TranslateDatebase.dart';
import 'package:e_commerce_app/data/model/categoriseModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ListListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListListCategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return SizedBox(
          height: 35,
          child: ListView.separated(
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListCategories(
                cate: CategoriesModel.fromJson(
                  controller.categories[index],
                ),
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        );
      },
    );
  }
}

class ListCategories extends GetView<ItemsControllerImp> {
  final CategoriesModel cate;
  final int index;

  const ListCategories({
    super.key,
    required this.cate,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      controller.ChangeCate(index, cate.cateId.toString());
    }, child: GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return AnimatedContainer(
          decoration: BoxDecoration(
              color: controller.selected == index ? Colors.black : null,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: controller.selected == index
                    ? Colors.white
                    : Colors.black26,
              )),
          duration: const Duration(milliseconds: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  " ${TranslateDatabase(cate.cateNameAr, cate.cateName)}",
                  style: TextStyle(
                      color: controller.selected == index
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
