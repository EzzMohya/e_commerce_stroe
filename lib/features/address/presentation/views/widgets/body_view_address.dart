
import 'package:e_commerce_app/controller/Address/viewController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/features/address/presentation/views/widgets/card_address.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BodyViewAddress extends StatelessWidget {
  const BodyViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GetBuilder<ViewAddressController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.status,
              widget: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
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
                                onPressed: (context) {
                                  controller.remove(
                                      controller.data[index].addressId
                                          .toString(),
                                      index);
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
                          child: CardAddress(
                            addressModel: controller.data[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
