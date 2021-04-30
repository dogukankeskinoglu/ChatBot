import 'package:f_chatbot/core/component/button/containerButton.dart';
import 'package:f_chatbot/core/controller/validator.dart';
import 'package:f_chatbot/core/exception/textform_field_exception.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:f_chatbot/page/background_page/opacity_background.dart';
import 'package:flutter/material.dart';

late var size;

class LoginPage extends StatelessWidget {
  final String img_src;
  final bool isCompany;
  final TextEditingController cEmail = TextEditingController();
  final TextEditingController cPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  LoginPage(this.img_src, this.isCompany);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: mainStack(size, context),
    );
  }

  Stack mainStack(Size size, BuildContext context) {
    return Stack(
      children: [
        pageImage(),
        alignContainer(size, context),
      ],
    );
  }

  OpacityBackGround pageImage() {
    return OpacityBackGround(
      imgsrc: img_src,
      opacity: 1,
    );
  }

  Align alignContainer(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Form(
        key: _formKey,
        child: Container(
          height: size.height / 2,
          width: size.width,
          padding: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textWelcome(),
                textFormFieldEmail(),
                textFormFieldPassword(),
                loginButton(size),
                textRow(context)
              ]),
        ),
      ),
    );
  }

  Row textRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ApplicationStrings.instance.hesapYokMu,
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, "/createAccountPersonal"),
          child: Text(
            ApplicationStrings.instance.hesapOlustur,
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  ContainerButton loginButton(Size size) {
    return ContainerButton(
        containerOnpressed: loginButtonFunction,
        containerColor: Colors.blue,
        containerText: ApplicationStrings.instance.login,
        containerHeightRate: 0.2,
        containerWidthRate: 1,
        containerRadius: 5);
  }

  Text textWelcome() {
    return Text(
      "Welcome to Login Page",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }

  void loginButtonFunction() {
    if (_formKey.currentState!.validate()) {
    } else {
      print("Lütfen düzgün formatta giriniz");
    }
  }

  TextFormField textFormFieldPassword() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: cPassword,
      maxLines: 1,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          prefixIcon: Icon(Icons.lock),
          hintText: "Password"),
      validator: (value) {
        if (value == null) {
          print(TextFormFieldException);
        } else {
          return isPasswordValid(value);
        }
      },
    );
  }

  TextFormField textFormFieldEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: cEmail,
      maxLines: 1,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          prefixIcon: Icon(Icons.email),
          hintText: "Email"),
      validator: (value) {
        if (value == null) {
          print(TextFormFieldException);
        } else {
          return isValidateEmail(value);
        }
      },
    );
  }
}
