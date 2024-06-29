import 'package:flutter/material.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({super.key});

  @override
  State<PaymentMethodList> createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  final List images = const [
    "assets/icons/card.svg",
    "assets/icons/paypal.svg",
  ];
  int selectItem = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectItem = index;
                  });
                },
                child: PaymentMethodItem(
                    isActive: selectItem == index ? true : false,
                    image: images[index])),
          );
        },
      ),
    );
  }
}
