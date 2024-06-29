import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingList extends StatelessWidget {
  const SettingList({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: ShapeDecoration(
            color: const Color(0xffEEEEEE),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            icon,
            color: Colors.black,
            height: 20,
            width: 30,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
      onTap: onTap,
      trailing: SvgPicture.asset("assets/icons/Right 2.svg"),
    );
  }
}
