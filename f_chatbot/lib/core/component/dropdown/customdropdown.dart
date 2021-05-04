import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomDropDownItem extends StatelessWidget {
  final String dropdownValue;
  final List<DropdownMenuItem<String>> items;
  final void Function(String s) function;

  const CustomDropDownItem(
      {Key? key,
      required this.dropdownValue,
      required this.items,
      required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        value: dropdownValue,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        items: items,
        onChanged: (value) => function(value.toString()),
      ),
    );
  }
}
