import 'package:f_chatbot/Company/CompanyHome/companyHome.dart';
import 'package:f_chatbot/Company/CompanyLogin/modelview/loginCompanyViewModel.dart';
import 'package:f_chatbot/core/component/button/containerButton.dart';
import 'package:f_chatbot/core/component/textFormField/customTextField.dart';
import 'package:f_chatbot/core/enum/imagePath.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:f_chatbot/page/background_page/opacity_background.dart';
import 'package:f_chatbot/page/load_page/loadPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginCompanyView extends LoginCompanyViewModel {
  late final snackBar;
  @override
  void initState() {
    super.initState();
    cCompanyName = TextEditingController();
    cPassword = TextEditingController();
    isLogin = UnauthenticatedEnum.FAIL;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: isLogin == UnauthenticatedEnum.SUCCESSFULL
            ? LoadPage(
                page: CompanyHome(
                companyName: cCompanyName.text,
              ))
            : mainStack(size, context));
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
      imgsrc: ImagePathEnums.CompanyLoginWallPaper.img,
      opacity: 1,
    );
  }

  Align alignContainer(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Form(
        key: formKey,
        child: Container(
          height: size.height / 2,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textWelcome(),
                customTextFormFieldEmail(),
                customTextFormFieldPassword(),
                loginButton(size),
                textRow(context),
              ]),
        ),
      ),
    );
  }

  CustomTextFormField customTextFormFieldEmail() {
    return CustomTextFormField(
      padding: EdgeInsets.all(0),
      hinttext: ApplicationStrings.instance.inputCompanyHint,
      prefixIcon: Icon(Icons.business),
      validator: ValidatorEnums.EmptyValidator,
      textcontroller: cCompanyName,
    );
  }

  CustomTextFormField customTextFormFieldPassword() {
    return CustomTextFormField(
      hinttext: ApplicationStrings.instance.inputPasswordHint,
      padding: EdgeInsets.all(0),
      keyboardType: TextInputType.text,
      obscure: true,
      prefixIcon: Icon(Icons.lock),
      validator: ValidatorEnums.EmptyValidator,
      textcontroller: cPassword,
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
          onTap: () => Navigator.pushNamed(context, "/createAccountCompany"),
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
        containerOnpressed: login,
        containerColor: Colors.blue,
        containerText: ApplicationStrings.instance.login,
        containerHeightRate: 0.08,
        containerWidthRate: 1,
        containerRadius: 30);
  }


  Text textWelcome() {
    return Text(
      "İş Veren Giriş Sayfası",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}
