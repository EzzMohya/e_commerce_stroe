import 'package:e_commerce_app/controller/user_controller.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/constant/decoration.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/ButtonAuth.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/textFormAuth.dart';
import 'package:e_commerce_app/features/back_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackWidget(),
        leadingWidth: 70,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: GetBuilder<UserController>(builder: (controller) {
                return HandlingDataView(
                    statusRequest: controller.status,
                    widget: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            TextFormAuth(
                              hint: "name",
                              icon: Icons.person,
                              label: 'Name',
                              mycontroller: controller.name,
                              valid: (String? val) {
                                return null;
                              },
                            ),
                            TextFormAuth(
                              hint: "Email",
                              icon: Icons.email,
                              label: 'Email',
                              mycontroller: controller.email,
                              valid: (String? val) {
                                return null;
                              },
                            ),
                            TextFormAuth(
                              hint: "Phone",
                              icon: Icons.phone,
                              label: 'Phone',
                              mycontroller: controller.phone,
                              valid: (String? val) {
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                    ));
              }),
            ),
          ),
          Positioned(
              top: 50,
              right: (MediaQuery.of(context).size.width / 2) - 40,
              left: (MediaQuery.of(context).size.width / 2) - 40,
              child: Container(
                decoration: ContainerStyle.userPhoto,
                height: 80,
                width: 80,
              )),
          Positioned(
            top: 103,
            right: (MediaQuery.of(context).size.width / 2) - 45,
            left: (MediaQuery.of(context).size.width / 2) + 15,
            child: Container(
              decoration: ContainerStyle.photoAdd,
              height: 30,
              child: const Icon(
                Icons.edit,
                size: 20,
              ),
            ),
          ),
          Positioned(
              top: 140,
              right: (MediaQuery.of(context).size.width / 2) - 45,
              left: (MediaQuery.of(context).size.width / 2) - 45,
              child: const Text(
                "Upload image",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              )),
          const Positioned(
              bottom: 10,
              right: 20,
              left: 20,
              child: ButtonAuth(title: "Save")),
        ],
      ),
    );
  }
}
