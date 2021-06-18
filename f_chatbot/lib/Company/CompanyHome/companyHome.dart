import 'package:f_chatbot/core/component/container/inkwellContainer.dart';
import 'package:f_chatbot/core/enum/imagePath.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:flutter/material.dart';

class CompanyHome extends StatelessWidget {
  final String companyName;

  const CompanyHome({Key? key, required this.companyName}) : super(key: key);
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
        companyName,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  Column containerRow(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkwellContainer(
          heightPercent: 0.2,
          onPressed: () {
            Navigator.pushNamed(context, "/CompanyInformation");
          },
          imgSrc: ImagePathEnums.CompanyInformationImage.img,
          text: ApplicationStrings.instance.companyInformation,
        ),
        InkwellContainer(
          heightPercent: 0.2,
          onPressed: () {
            Navigator.pushNamed(context, "/CompanyJobs");
          },
          imgSrc: ImagePathEnums.CompanyJobImage.img,
          text: ApplicationStrings.instance.companyJob,
        ),
        InkwellContainer(
          heightPercent: 0.2,
          onPressed: () {
            Navigator.pushNamed(context, "/CreateJob");
          },
          imgSrc: ImagePathEnums.CreateJobImage.img,
          text: ApplicationStrings.instance.createJob,
        ),
      ],
    );
  }
}
