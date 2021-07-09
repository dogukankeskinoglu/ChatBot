import 'dart:collection';

import 'package:f_chatbot/core/component/container/inkwellContainer.dart';
import 'package:f_chatbot/core/enum/imagePath.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  var refTest = FirebaseDatabase.instance.reference().child("test");

  var test = HashMap<String, dynamic>();

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
        ),
        /*InkwellContainer(
          onPressed: () {
            /*test["mesaj"] = "test";
            print("sa");
            refTest.set(test);*/
            Navigator.pushNamed(context, "/CandidateChat");
          },
          imgSrc: ImagePathEnums.CandidateImage.img,
          text: ApplicationStrings.instance.loginHomeCandidate,
        ),*/
      ],
    );
  }
}
