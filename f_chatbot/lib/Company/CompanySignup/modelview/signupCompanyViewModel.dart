
import 'package:f_chatbot/Company/CompanySignup/view/signupCompany.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:flutter/material.dart';

abstract class SignupCompanyViewModel extends BaseStateFull<SignupCompany>{
  TextEditingController tcCompanyName = TextEditingController();
  TextEditingController tcCompanyUsername= TextEditingController();
  TextEditingController tcCompanyEmail = TextEditingController();
  TextEditingController tcCompanyPassword= TextEditingController();
  late UnauthenticatedEnum signUp;
  final formKey = GlobalKey<FormState>();

  void signup(){
    setState(() {
      if (formKey.currentState!.validate()) {
        signUp = UnauthenticatedEnum.SUCCESSFULL;
      }
    });
  }
}