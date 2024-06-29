import 'package:e_commerce_app/data/model/addressModel.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  const CardAddress(
      {super.key, required this.addressModel});
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
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
              height: 90,
            ),
            Positioned(
                top: 10,
                bottom: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: const Icon(
                    FluentIcons.location_12_filled,
                    size: 60,
                  ),
                )),
            Positioned(
              top: 12,
              right: 90,
              left: 90,
              child: Text(
                "Name : ${addressModel.addressName}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 35,
              right: 90,
              left: 90,
              child: Text(
                "City : ${addressModel.addressCity}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 55,
              right: 90,
              left: 90,
              child: Text(
                "Street : ${addressModel.addressStreet}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}








    //     Container(
    //   margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
    //   decoration: BoxDecoration(
    //       color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
    //   child: ListTile(
    //     leading: const Icon(FluentIcons.location_12_filled),
    //     trailing: IconButton(
    //         onPressed: onRemove,
    //         icon: const Icon(FluentIcons.delete_12_regular)),
    //     title: Text(
    //       "${addressModel.addressName}",
    //       style: const TextStyle(color: Colors.black, fontSize: 14),
    //     ),
    //   ),
    // );