import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/HomeController.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends GetView<HomeControllerImp> {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 260,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.offers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              children: [
                Container(
                  height: 160,
                  width: 260,
                  decoration: BoxDecoration(
                      color: const Color(0xffDCDCDC),
                      borderRadius: BorderRadius.circular(30)),
                ),
                Positioned(
                    top: 17,
                    left: 15,
                    child: Text(
                      "${controller.offers[index].offerTitle}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    )),
                Positioned(
                    top: 53,
                    left: 15,
                    child: Text(
                      "${controller.offers[index].offerSub}",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    )),
                const Positioned(
                    top: 88,
                    left: 15,
                    child: Text(
                      "With code:FSCREATION",
                      style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.normal),
                    )),
                Positioned(
                    top: 0,
                    right: -30,
                    bottom: 0,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagesOffer}/${controller.offers[index].offerImage}",
                      height: 170,
                      width: 150,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 118,
                    left: 15,
                    bottom: 17,
                    child: Container(
                      decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                          child: Text(
                            "Get Now",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
