
import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:flutter/material.dart';

class CustomTextFormFields {
  final TextInputType inputType;
  final TextEditingController controller;
  final Icon prefixIcon;
  final String hintText;
  final ValidatorEnums validatorEnum;

  CustomTextFormFields(this.inputType, this.controller, this.prefixIcon,
      this.hintText, this.validatorEnum);

  TextFormField getTextFormField() {
    return TextFormField(
        keyboardType: inputType,
        controller: controller,
        validator: (value) {
          switch (validatorEnum) {
            case ValidatorEnums.LoginEmail:
              value!.isValidEmail();
              break;
            case ValidatorEnums.LoginPassword:
              value!.isValidPassword();
              break;
            default:
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            prefixIcon: prefixIcon,
            hintText: hintText));
  }
}

extension StringExtension on String {
  String? isValidPassword() {
    if (isEmpty) {
      return "Cannot be empty";
    }
    return null;
  }

  String? isValidEmail() {
    if (isEmpty) {
      return "Cannot be empty";
    }
    return null;
  }
}
