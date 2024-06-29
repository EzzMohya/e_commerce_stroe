import 'package:e_commerce_app/controller/HomeController.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/decoration.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

import 'widgets/setting_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return ListView(
      clipBehavior: Clip.none,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: ContainerStyle.decoration,
            child: ListTile(
              minVerticalPadding: 15,
              titleAlignment: ListTileTitleAlignment.bottom,
              leading: const Icon(
                FontAwesome.user,
                size: 50,
              ),
              title: Text(
                controller.user,
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                controller.email,
                style: TextStyle(
                    color: Colors.grey.shade500, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColor.secondaryColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingList(
                    title: 'Personal Details',
                    icon: 'assets/icons/Profile.svg',
                    onTap: () {
                      Get.toNamed(Approuts.personalInfo);
                    },
                  ),
                  SettingList(
                    title: 'My Order',
                    icon: 'assets/icons/Bag.svg',
                    onTap: () {
                      Get.toNamed(Approuts.pendingOrder);
                    },
                  ),
                  SettingList(
                    title: 'My Archive',
                    icon: 'assets/icons/archive.svg',
                    onTap: () {
                      Get.toNamed(Approuts.orderArchive);
                    },
                  ),
                  SettingList(
                    title: 'Shipping Address',
                    icon: 'assets/icons/map.svg',
                    onTap: () {
                      Get.toNamed(Approuts.viewAddress);
                    },
                  ),
                  SettingList(
                    title: 'Settings',
                    icon: 'assets/icons/setting.svg',
                    onTap: () {
                      Get.toNamed(Approuts.setting);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: const Color(0xffE4E4E4))),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingList(
                    title: 'Privacy Policy',
                    icon: 'assets/icons/Shield.svg',
                    onTap: () {},
                  ),
                  SettingList(
                    title: 'Rate the app',
                    icon: 'assets/icons/Like.svg',
                    onTap: () {},
                  ),
                  SettingList(
                    title: 'Share',
                    icon: 'assets/icons/share.svg',
                    onTap: () {},
                  ),
                  SettingList(
                    title: 'About Us',
                    icon: 'assets/icons/Information.svg',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
