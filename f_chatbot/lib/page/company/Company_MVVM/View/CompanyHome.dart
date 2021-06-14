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

  Row containerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkwellContainer(
          onPressed: () {
            Navigator.pushNamed(context, "/CompanyInformation");
          },
          img_src: ImagePathEnums.CompanyInformationImage.img,
          text: ApplicationStrings.instance.companyInformation,
        ),
        InkwellContainer(
          onPressed: () {
            Navigator.pushNamed(context, "/CompanyJobs");
          },
          img_src: ImagePathEnums.CompanyJobImage.img,
          text: ApplicationStrings.instance.companyJob,
        )
      ],
    );
  }
}
