import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomDropDownItem extends StatelessWidget {
  final String dropdownValue;
  final List<DropdownMenuItem<String>> items;
  final void Function(String s) function;
  final EdgeInsetsGeometry padding;

  const CustomDropDownItem({
    Key? key,
    required this.dropdownValue,
    required this.items,
    required this.function,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          value: dropdownValue,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          items: items,
          onChanged: (value) => function(value.toString()),
        ),
      ),
    );
  }
}
