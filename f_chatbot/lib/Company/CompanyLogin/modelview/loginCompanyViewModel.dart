import 'package:f_chatbot/Company/CompanyLogin/view/loginCompany.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:flutter/material.dart';

abstract class LoginCompanyViewModel extends BaseStateFull<LoginCompany>{

  late final TextEditingController cCompanyName;
  late final TextEditingController cPassword;
  late UnauthenticatedEnum isLogin;
  final formKey = GlobalKey<FormState>();

  void login() {
    setState(() {
      if (formKey.currentState!.validate()) {
        isLogin = UnauthenticatedEnum.SUCCESSFULL;
      }
    });
  }
}