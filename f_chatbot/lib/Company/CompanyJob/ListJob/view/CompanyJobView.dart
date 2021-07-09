import 'package:f_chatbot/Company/CompanyJob/ListJob/modelview/CompanyListJobViewModel.dart';
import 'package:f_chatbot/Company/companyCandidate.dart';
import 'package:f_chatbot/core/component/card/companyJobCard.dart';
import 'package:flutter/material.dart';

class CompanyJobView extends CompanyListJobViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildJobColumn());
  }

  AppBar buildAppBar() {
    return AppBar(title: Text("Company İlanlar"));
  }

  ListView buildJobColumn() {
    return ListView.builder(
        itemCount: companyJobs.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompanyCandidate(
                              jobTitle: companyJobs[index].title,
                            )),
                  ),
              child: CompanyJobCard(companyJobs[index], index+1));
        });
  }
}
