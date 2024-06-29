import 'package:e_commerce_app/features/cart/presentation/views/cart.dart';
import 'package:e_commerce_app/features/home/presentation/views/home.dart';
import 'package:e_commerce_app/features/notification/presentation/views/notification.dart';
import 'package:e_commerce_app/features/settings/presentation/views/profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  onPressed(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  final PageController pageController = PageController();
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  List<Widget> items = [
    NavigationDestination(
      icon: SvgPicture.asset(
        "assets/icons/Home.svg",
        height: 20,
        width: 20,
      ),
      selectedIcon: SvgPicture.asset(
        "assets/icons/Home.svg",
        height: 20,
        width: 20,
        color: Colors.white,
      ),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(
        "assets/icons/Notification.svg",
        height: 20,
        width: 20,
      ),
      selectedIcon: SvgPicture.asset(
        "assets/icons/Notification.svg",
        height: 20,
        width: 20,
        color: Colors.white,
      ),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(
        "assets/icons/Cart.svg",
        height: 20,
        width: 20,
      ),
      selectedIcon: SvgPicture.asset(
        "assets/icons/Cart.svg",
        height: 20,
        width: 20,
        color: Colors.white,
      ),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(
        "assets/icons/Profile.svg",
        height: 20,
        width: 20,
      ),
      selectedIcon: SvgPicture.asset(
        "assets/icons/Profile.svg",
        height: 20,
        width: 20,
        color: Colors.white,
      ),
      label: '',
    ),
  ];
  List pages = [
    const Home(),
    const NotificationView(),
    const Cart(),
    const ProfilePage(),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  onPressed(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    selectedIndex = 0;
    super.onInit();
  }
}
