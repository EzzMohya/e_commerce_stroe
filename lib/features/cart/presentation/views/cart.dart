import 'package:e_commerce_app/controller/CartController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/cardCart.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/cart_sheet.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/coupon_widget.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/priceAndcount.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) {
            return CartSheet(
              controller: controller,
            );
          },
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: const BackWidget(),
          title: const Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.status,
              widget: ListView(
                children: [
                  ...List.generate(
                    controller.data.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
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
                      child: Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) async {
                                await controller.remove(
                                    controller.data[index].itemId, 0);
                                controller.refreshPage();
                              },
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              icon: FluentIcons.delete_12_filled,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: CardCart(
                          widget: PriceAndCountItems(
                            AddItems: () async {
                              await controller.add(
                                  controller.data[index].itemId, 1);
                              controller.refreshPage();
                            },
                            RemoveItem: () async {
                              await controller.remove(
                                  controller.data[index].itemId, 1);
                              controller.refreshPage();
                            },
                            countItems: "${controller.data[index].countitems}",
                          ),
                          itemName: '${controller.data[index].itemName}',
                          image:
                              '${AppLink.imagesitem}/${controller.data[index].itemImage}',
                          price: "\$${controller.data[index].itemPrice}",
                        ),
                      ),
                    ),
                  ),
                  CouponWidget(
                    controller: controller,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
