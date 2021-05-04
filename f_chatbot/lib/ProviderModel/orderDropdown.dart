import 'package:f_chatbot/core/enum/customOrder.dart';
import 'package:flutter/material.dart';

class DropDownOrderModel extends ChangeNotifier {
  String selectedValue = CustomOrderEnums.puan_artan.text;

  void changeValue(String newOrderName) {
    selectedValue = newOrderName;
    print("girdi");
    notifyListeners();
  }
}
