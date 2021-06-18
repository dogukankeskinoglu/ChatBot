import 'package:f_chatbot/core/controller/validator.dart';
import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:f_chatbot/core/exception/textform_field_exception.dart';
import 'package:f_chatbot/core/exception/validator_exception.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textcontroller;
  final String hinttext;
  final EdgeInsetsGeometry padding;
  final int maxLines;
  final Icon prefixIcon;
  final bool obscure;
  final TextInputType keyboardType;
  final ValidatorEnums validator;
  const CustomTextFormField(
      {Key? key,
      required this.textcontroller,
      required this.hinttext,
      required this.prefixIcon,
      this.padding= const EdgeInsets.symmetric(vertical: 8.0),
      this.maxLines = 1,
      this.obscure=false,
      this.keyboardType = TextInputType.text,
      this.validator = ValidatorEnums.EmptyValidator,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: textcontroller,
        maxLines: maxLines,
        obscureText: obscure,
        decoration: InputDecoration(
            labelText: hinttext,
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
                return isValidateEmail(textcontroller.text);
              case ValidatorEnums.PasswordLoginValidator:
                print("loginpassword");
                return isPasswordValid(textcontroller.text);
              case ValidatorEnums.EmptyValidator:
                return isEmptyValue(textcontroller.text);
              case ValidatorEnums.EmailValidator:
                return isValidateEmail(textcontroller.text);
              case ValidatorEnums.PhoneValidator:
                return isValidPhone(textcontroller.text);
              default:
                ValidatorException(validator);
            }
          }
        },
      ),
    );
  }
}
