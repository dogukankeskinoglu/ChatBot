import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:f_chatbot/core/exception/textform_field_exception.dart';
import 'package:f_chatbot/core/exception/validator_exception.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textcontroller;
  final String hinttext;
  final int maxLines;
  final Icon prefixIcon;
  final TextInputType keyboardType;
  final ValidatorEnums validator;
  const CustomTextFormField(
      {Key? key,
      required this.textcontroller,
      required this.hinttext,
      required this.prefixIcon,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,
      this.validator = ValidatorEnums.EmptyValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textcontroller,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          prefixIcon: prefixIcon,
          hintText: hinttext),
      validator: (value) {
        if (value == null) {
          print(TextFormFieldException);
        } else {
          switch (validator) {
            case ValidatorEnums.EmailLoginValidator:
              print("emailpassword");
              print(value);
              break;
            case ValidatorEnums.PasswordLoginValidator:
              print("loginpassword");
              break;
            case ValidatorEnums.EmptyValidator:
              print("control is empty");
              break;
            case ValidatorEnums.EmailValidator:
              print("LUtfen geCerli mail giriniz");
              break;
            case ValidatorEnums.PhoneValidator:
              print("LUtfen geCerli telefon no giriniz");
              break;
            default:
              ValidatorException(validator);
          }
        }
      },
    );
  }
}
