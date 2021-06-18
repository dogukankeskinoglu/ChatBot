import 'package:f_chatbot/Candidate/CandidateJob/view/candidateJob.dart';
import 'package:f_chatbot/Candidate/CandidateLogin/modelview/loginViewModel.dart';
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

class LoginCandidateView extends LoginCandidateViewModel{

  @override
    void initState() {
      super.initState();
      cEmail = TextEditingController();
      cPassword = TextEditingController();
      isLogin = UnauthenticatedEnum.FAIL;
    }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: isLogin == UnauthenticatedEnum.FAIL
            ? mainStack(size, context)
            : LoadPage(page: CandidateJob()));
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
      hinttext: ApplicationStrings.instance.inputEmailHint,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(Icons.email_outlined),
      validator: ValidatorEnums.EmailLoginValidator,
      textcontroller: cEmail,
    );
  }

  CustomTextFormField customTextFormFieldPassword() {
    return CustomTextFormField(
      padding: EdgeInsets.all(0),
      hinttext: ApplicationStrings.instance.inputPasswordHint,
      keyboardType: TextInputType.text,
      obscure: true,
      prefixIcon: Icon(Icons.lock),
      validator: ValidatorEnums.PasswordLoginValidator,
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
        containerOnpressed: login,
        containerColor: Colors.blue,
        containerText: ApplicationStrings.instance.login,
        containerHeightRate: 0.08,
        containerWidthRate: 1,
        containerRadius: 30);
  }

  Text textWelcome() {
    return Text(
      "İş Arayan Giriş Sayfası",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }

  
}