import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    super.key,
    required this.title,
    this.searchOnPressed,
    this.onPressedFavorite,
    this.onChanged,
    required this.searchController,
  });
  final String title;
  final void Function()? searchOnPressed;
  final void Function()? onPressedFavorite;
  final void Function(String)? onChanged;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          onChanged: onChanged,
          controller: searchController,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            prefixIcon: IconButton(
              icon: const Icon(
                FluentIcons.search_24_filled,
              ),
              onPressed: searchOnPressed,
            ),
            filled: true,
            fillColor: const Color(0xffDCDCDC),
            contentPadding: const EdgeInsets.symmetric(horizontal: 13),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none),
          ),
        )),
        SizedBox(
          width: 10,
        ),
        IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateColor.resolveWith(
              (states) => Colors.black,
            )),
            onPressed: onPressedFavorite,
            icon: Padding(
              padding: EdgeInsets.all(2.5),
              child: Icon(
                FluentIcons.heart_28_filled,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
