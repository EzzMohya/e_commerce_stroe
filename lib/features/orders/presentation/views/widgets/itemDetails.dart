// ignore_for_file: file_names, non_constant_identifier_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/ProductDetailController.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/priceAndcount.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailControllerImp controllerImp =
        Get.put(ProductDetailControllerImp());
    return Scaffold(
        backgroundColor: const Color(0xffDADEDF),
        appBar: AppBar(
          backgroundColor: const Color(0xffDADEDF),
          automaticallyImplyLeading: false,
          leadingWidth: 80,
          leading: const BackWidget(),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Approuts.cart);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: SvgPicture.asset(
                  'assets/images/cart.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<ProductDetailControllerImp>(
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: "${controller.itemsmodel.itemId}",
                    child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imagesitem}/${controller.itemsmodel.itemImage}"),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 310,
                      decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)))),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    Positioned(
                      top: 30,
                      left: 25,
                      child: Text(
                        "${controller.itemsmodel.itemName}",
                        style: context.textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 25,
                      child: PriceAndCountItems(
                        controller: controller,
                        AddItems: () {
                          controller.add();
                        },
                        RemoveItem: () {
                          controller.minus();
                        },
                        countItems: "${controller.count}",
                      ),
                    ),
                    Positioned(
                      top: 72,
                      left: 25,
                      right: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ...List.generate(5, (int index) {
                                return const Icon(
                                  Icons.star,
                                  color: Color(0xffFFAB07),
                                );
                              })
                            ],
                          ),
                          const Text(
                            "Available in stock",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 105,
                        right: 25,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                              shadows: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    blurStyle: BlurStyle.normal)
                              ],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Column(
                            children: [
                              ...List.generate(4, (int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: controller.colors[index],
                                  ),
                                );
                              })
                            ],
                          ),
                        )),
                    Positioned(
                      top: 118,
                      left: 25,
                      child: Text(
                        "Size",
                        style: context.textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Positioned(
                      top: 154,
                      left: 25,
                      child: Row(
                        children: [
                          ...List.generate(controller.sizes.length,
                              (int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                  backgroundColor: const Color(0xff888888),
                                  radius: 20,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 19,
                                    child: Text("${controller.sizes[index]}"),
                                  )),
                            );
                          })
                        ],
                      ),
                    ),
                    Positioned(
                      top: 230,
                      left: 25,
                      child: Text(
                        "Description",
                        style: context.textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Positioned.fill(
                      top: 270,
                      left: 25,
                      child: Text(
                        "${controller.itemsmodel.itemDisc}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 25,
                      right: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Total Price",
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "${int.parse(controllerImp.itemsmodel.itemPrice!) * controllerImp.count}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<ProductDetailControllerImp>(
                        builder: (controller) {
                      return Visibility(
                        visible: controller.anim,
                        replacement: Positioned(
                          bottom: -80,
                          right: -10,
                          child: Lottie.asset(
                            'assets/lottie/add to cart.json',
                            height: 200,
                            width: 230,
                            fit: BoxFit.scaleDown,
                            repeat: false,
                            onLoaded: (p0) {
                              Future.delayed(const Duration(seconds: 5), () {
                                controller.replace();
                              });
                            },
                          ),
                        ),
                        child: Positioned(
                          bottom: 0,
                          right: 25,
                          child: GestureDetector(
                            onTap: () {
                              controller.addItems(controller.itemsmodel.itemId,
                                  controller.count);
                              controller.replace();
                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: ShapeDecoration(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/bag.svg",
                                    height: 16,
                                    width: 16,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ],
            );
          },
        ));
  }
}
