import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/features/back_widget.dart';
import 'package:e_commerce_app/features/settings/presentation/views/widgets/setting_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        centerTitle: true,
        title: const Text("Settings"),
        leading: const BackWidget(),
      ),
      body: ListView(
        children: [
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
                      title: 'Language',
                      icon: 'assets/icons/global.svg',
                      onTap: () {},
                    ),
                    SwitchListTile(
                      visualDensity: VisualDensity.compact,
                      value: true,
                      onChanged: (bool value) {},
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            "assets/icons/Notification.svg",
                            color: Colors.black,
                            height: 20,
                            width: 30,
                            fit: BoxFit.scaleDown,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          const Text(
                            "Notifiaction",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SettingList(
                      title: 'Dark Mode',
                      icon: 'assets/icons/Moon.svg',
                      onTap: () {},
                    ),
                    SettingList(
                      title: 'Help Center',
                      icon: 'assets/icons/help.svg',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
