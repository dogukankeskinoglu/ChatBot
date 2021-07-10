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
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (index == 0) {
                      return CompanyCandidate(
                        job: companyJobs[index],
                        employees: [employees[0], employees[1], employees[2]],
                      );
                    } else if (index == 1) {
                      return CompanyCandidate(
                        job: companyJobs[index],
                        employees: [employees[3], employees[4], employees[5]],
                      );
                    } else {
                      return CompanyCandidate(
                        job: companyJobs[index],
                        employees: [employees[1]],
                      );
                    }
                  })),
              child: CompanyJobCard(companyJobs[index], index + 1));
        });
  }
}
