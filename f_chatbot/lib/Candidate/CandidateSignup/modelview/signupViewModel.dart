import 'package:f_chatbot/Candidate/CandidateSignup/view/singupCandidate.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:flutter/material.dart';

abstract class SignupCandidateViewModel extends BaseStateFull<SignupCandidate> {
  
  TextEditingController cName=new TextEditingController();
  TextEditingController cSurname=new TextEditingController();
  TextEditingController cUsername=new TextEditingController();
  TextEditingController cEmail=new TextEditingController();
  TextEditingController cPassword=new TextEditingController();
  late UnauthenticatedEnum isSignup;
  final formKey = GlobalKey<FormState>();

  void signUp() {
    setState(() {
      if (formKey.currentState!.validate()) {
        isSignup = UnauthenticatedEnum.SUCCESSFULL;
      }
    });
  }
}
