
import 'package:e_commerce_app/controller/Address/addController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/ButtonAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textFormAuth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BodyAddAddressView extends StatelessWidget {
  const BodyAddAddressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<AddAddressController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.status,
              widget: ListView(
                children: [
                  TextFormAuth(
                    icon: FluentIcons.city_16_filled,
                    label: "Name",
                    hint: "Name",
                    mycontroller: controller.name,
                    valid: (p0) {
                      return null;
                    },
                  ),
                  TextFormAuth(
                    icon: FluentIcons.city_16_filled,
                    label: "city",
                    hint: "city",
                    mycontroller: controller.city,
                    valid: (p0) {
                      return null;
                    },
                  ),
                  TextFormAuth(
                    icon: FluentIcons.street_sign_20_filled,
                    label: "Street",
                    hint: "Street",
                    mycontroller: controller.street,
                    valid: (p0) {
                      return null;
                    },
                  ),
                  ButtonAuth(
                    title: 'Add',
                    onPressed: () {
                      controller.add();
                    },
                  )
                ],
              ));
        },
      ),
    );
  }
}
