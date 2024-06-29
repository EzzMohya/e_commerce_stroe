// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormAuth extends StatelessWidget {
  const TextFormAuth({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.mycontroller,
    required this.valid,
    this.keyboardType,
    this.secure,
    this.ontap,
  });
  final IconData icon;
  final String label;
  final String hint;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final TextInputType? keyboardType;
  final ontap;
  final secure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: secure == null || secure == true ? false : true,
        validator: valid,
        keyboardType: keyboardType,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600),
        controller: mycontroller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.textTheme.labelLarge!
                .copyWith(color: Colors.grey.shade400, fontSize: 12),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                label,
                style: context.textTheme.displayLarge!
                    .copyWith(color: Colors.grey.shade400),
              ),
            ),
            suffixIcon: InkWell(
              onTap: ontap,
              child: Icon(
                icon,
                color: Colors.grey.shade400,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
