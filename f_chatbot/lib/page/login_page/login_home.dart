import 'package:f_chatbot/core/component/container/inkwellContainer.dart';
import 'package:f_chatbot/core/enum/imagePath.dart';
import 'package:flutter/material.dart';

class LoginHome extends StatelessWidget {
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
        "Welcome Our Application",
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
          img_src: ImagePathEnums.CompanyImage.img,
          text: "Company",
        ),
        InkwellContainer(
          onPressed: () {
            Navigator.pushNamed(context, "/loginPersonal");
          },
          img_src: ImagePathEnums.CandidateImage.img,
          text: "Candidate",
        )
      ],
    );
  }
}
