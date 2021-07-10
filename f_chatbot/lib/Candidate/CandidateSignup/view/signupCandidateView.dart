import 'package:f_chatbot/Candidate/CandidateChat/view/candidateChat.dart';
import 'package:f_chatbot/Candidate/CandidateJob/view/candidateJob.dart';
import 'package:f_chatbot/Candidate/CandidateSignup/modelview/signupViewModel.dart';
import 'package:f_chatbot/core/component/button/containerButton.dart';
import 'package:f_chatbot/core/component/textFormField/customTextField.dart';
import 'package:f_chatbot/core/enum/imagePath.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:f_chatbot/page/background_page/opacity_background.dart';
import 'package:f_chatbot/page/load_page/loadPage.dart';
import 'package:flutter/material.dart';

class SignupCandidateView extends SignupCandidateViewModel {
  @override
  void initState() {
    super.initState();
    isSignup = UnauthenticatedEnum.FAIL;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: isSignup == UnauthenticatedEnum.FAIL
            ? mainStack(size, context)
            : LoadPage(page: CandidateChat()));
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
      imgsrc: ImagePathEnums.CandidateLoginWallPaper.img,
      heightPercent: 0.2,
      opacity: 1,
    );
  }

  Align alignContainer(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Form(
        key: formKey,
        child: Container(
          height: size.height * 0.8,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textWelcome(),
                customTextFormFieldNameSurname(),
                customTextFormFieldUsername(),
                customTextFormFieldEmail(),
                customTextFormFieldPassword(),
                singUpButton(size),
                textRow(context),
              ]),
        ),
      ),
    );
  }

  CustomTextFormField customTextFormFieldNameSurname() {
    return CustomTextFormField(
      hinttext: ApplicationStrings.instance.inputNameSurnameHint,
      padding: EdgeInsets.symmetric(vertical: 0),
      prefixIcon: Icon(Icons.account_circle),
      validator: ValidatorEnums.EmptyValidator,
      textcontroller: cName,
    );
  }

  CustomTextFormField customTextFormFieldUsername() {
    return CustomTextFormField(
      hinttext: ApplicationStrings.instance.inputUsernameHint,
      padding: EdgeInsets.symmetric(vertical: 0),
      prefixIcon: Icon(Icons.insert_drive_file),
      validator: ValidatorEnums.EmptyValidator,
      textcontroller: cUsername,
    );
  }

  CustomTextFormField customTextFormFieldEmail() {
    return CustomTextFormField(
      hinttext: ApplicationStrings.instance.inputEmailHint,
      keyboardType: TextInputType.emailAddress,
      padding: EdgeInsets.symmetric(vertical: 0),
      prefixIcon: Icon(Icons.email_outlined),
      validator: ValidatorEnums.EmailLoginValidator,
      textcontroller: cEmail,
    );
  }

  CustomTextFormField customTextFormFieldPassword() {
    return CustomTextFormField(
      hinttext: ApplicationStrings.instance.inputPasswordHint,
      keyboardType: TextInputType.text,
      padding: EdgeInsets.symmetric(vertical: 0),
      prefixIcon: Icon(Icons.lock),
      obscure: true,
      validator: ValidatorEnums.PasswordLoginValidator,
      textcontroller: cPassword,
    );
  }

  Row textRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ApplicationStrings.instance.hesapVarMi,
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, "/loginPersonal"),
          child: Text(
            ApplicationStrings.instance.hesapGiris,
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  ContainerButton singUpButton(Size size) {
    return ContainerButton(
        containerOnpressed: signUp,
        containerColor: Colors.blue,
        containerText: ApplicationStrings.instance.signup,
        containerHeightRate: 0.08,
        containerWidthRate: 1,
        containerRadius: 30);
  }

  Text textWelcome() {
    return Text(
      "İş Arayan Üye Sayfası",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}
