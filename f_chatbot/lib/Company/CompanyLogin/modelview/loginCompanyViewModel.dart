import 'package:f_chatbot/Company/CompanyLogin/view/loginCompany.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:flutter/material.dart';

abstract class LoginCompanyViewModel extends BaseStateFull<LoginCompany> {
  late final TextEditingController cCompanyName;
  late final TextEditingController cPassword;
  late UnauthenticatedEnum isLogin = UnauthenticatedEnum.FAIL;
  final formKey = GlobalKey<FormState>();
  final companyId = "company";
  final companyPassword = "1234567";

  void login() {
    setState(() {
      if (formKey.currentState!.validate()) {
        isLogin = UnauthenticatedEnum.SUCCESSFULL;
      }
    });
  }

  bool isValidUsername(String username) {
    return companyId == username;
  }

  bool isValidPassword(String password) {
    return companyPassword == password;
  }
}
