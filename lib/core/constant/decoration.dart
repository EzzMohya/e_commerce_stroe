import 'package:flutter/material.dart';

class ContainerStyle {
  static ShapeDecoration decoration = ShapeDecoration(
      shadows: [
        BoxShadow(
            offset: const Offset(0, 7),
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            blurStyle: BlurStyle.normal)
      ],
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)));
  static ShapeDecoration decorationBlack = ShapeDecoration(
      shadows: [
        BoxShadow(
            offset: const Offset(0, 7),
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            blurStyle: BlurStyle.normal)
      ],
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  static ShapeDecoration userPhoto = ShapeDecoration(
      color: const Color(0xffEDEDED),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)));
  static ShapeDecoration photoAdd = ShapeDecoration(
      shadows: [
        BoxShadow(
            offset: const Offset(0, 7),
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            blurStyle: BlurStyle.normal)
      ],
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
}
