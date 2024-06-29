import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/core/constant/decoration.dart';
import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_Preview_list.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CheckoutPreview extends StatelessWidget {
  const CheckoutPreview({super.key, required this.controller});
  final CheckoutController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Shipping Address",
                style: Styles.style18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              decoration: ContainerStyle.decoration,
              child: ListTile(
                visualDensity: VisualDensity.compact,
                leading: const Icon(FluentIcons.location_12_filled),
                title: Text(
                  "${controller.dataaddress[int.parse(controller.addressIndex!)].addressName}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "City : ${controller.dataaddress[int.parse(controller.addressIndex!)].addressCity}  ",
                    ),
                    Text(
                      "Street : ${controller.dataaddress[int.parse(controller.addressIndex!)].addressStreet}  ",
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Order Details",
                style: Styles.style18,
              ),
            ),
            ...List.generate(controller.data.length, (int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CheckoutPreviewList(
                  controller: controller,
                  index: index,
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const ListTile(
                  visualDensity: VisualDensity.compact,
                  title: Text(
                    "Free Shipping",
                    style: Styles.style18,
                  ),
                  trailing: Text(
                    "\$0",
                    style: Styles.style18,
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity.compact,
                  title: const Text(
                    "Total",
                    style: Styles.style18,
                  ),
                  trailing: Text(
                    "\$${controller.getPriceTotal()}",
                    style: Styles.style18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
