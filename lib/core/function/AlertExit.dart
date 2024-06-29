// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(
      title: 'Alert',
      content: const Text(
        'Do you want to quit?',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      actions: [
        TextButton(
            onPressed: () {
              exit(0);
            },
            child: const Text('Confirm')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel')),
      ]);

  return Future.value(true);
}
