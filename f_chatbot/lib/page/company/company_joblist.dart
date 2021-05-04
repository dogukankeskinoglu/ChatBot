
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CompanyJobPage extends StatelessWidget {
  TextEditingController companyName = TextEditingController();
  TextEditingController companyDescription = TextEditingController();
  TextEditingController companyTelephone = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyWebsite = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //KuruluS tarih
  //Sektör

  @override
  Widget build(BuildContext context) {
    Size sizeContext = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(child: Text("JobList")),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Job"),
    );
  }
}
