import 'package:e_commerce_app/controller/checkoutController.dart';
import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_method_list.dart';

class PaymentMethodBodyView extends StatelessWidget {
  const PaymentMethodBodyView({super.key, required this.controller});
  final CheckoutController controller;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        const SliverToBoxAdapter(child:  PaymentMethodList()),
        // SliverToBoxAdapter(
        //     child: PaymentCardCredit(
        //   formKey: formKey,
        //   autovalidateMode: autovalidateMode,
        // )),
        SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              shrinkWrap: true,
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
            ),
          ),
        ),
      ],
    );
  }
}
