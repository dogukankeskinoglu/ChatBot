import 'package:f_chatbot/Candidate/CandidateLogin/view/loginCandidate.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:flutter/material.dart';

abstract class LoginCandidateViewModel extends BaseStateFull<LoginCandidate>{

  late final TextEditingController cUsername;
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