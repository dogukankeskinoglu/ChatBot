import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  UnauthenticatedEnum loginState = UnauthenticatedEnum.FAIL;

  void changeValue(UnauthenticatedEnum newState) {
    loginState = newState;
    notifyListeners();
  }
}
