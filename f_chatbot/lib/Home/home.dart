import 'package:f_chatbot/core/component/container/inkwellContainer.dart';
import 'package:f_chatbot/core/enum/imagePath.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: containerRow(context),
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      title: Text(
        ApplicationStrings.instance.appTitle,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  Row containerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkwellContainer(
          onPressed: () {
            Navigator.pushNamed(context, "/loginCompany");
          },
          imgSrc: ImagePathEnums.CompanyImage.img,
          text: ApplicationStrings.instance.loginHomeCompany,
        ),
        InkwellContainer(
          onPressed: () {
            Navigator.pushNamed(context, "/loginPersonal");
          },
          imgSrc: ImagePathEnums.CandidateImage.img,
          text: ApplicationStrings.instance.loginHomeCandidate,
        )
      ],
    );
  }
}