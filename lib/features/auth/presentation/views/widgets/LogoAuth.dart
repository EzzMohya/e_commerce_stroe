// ignore_for_file: file_names

import 'package:e_commerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Image.asset(
        APPimage.logo,
        height: 150,
      ),
    );
  }
}
