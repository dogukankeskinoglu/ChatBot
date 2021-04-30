import 'package:f_chatbot/core/component/circular_percantege/circular_percantage.dart';
import 'package:f_chatbot/model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:f_chatbot/core/enum/jobAction.dart';

class JobCardWidget extends StatelessWidget {
  final JobModel jmodel;
  JobCardWidget(this.jmodel);
  @override
  Card build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: CircularPercantageWidget(radius: jmodel.matchRate),
          title: Text(jmodel.domainName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(jmodel.companyName),
              Text(jmodel.location),
              Text(jmodel.time.toIso8601String())
            ],
          ),
          trailing: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 10,
              color: jmodel.jobSituation.color)),
    );
  }
}
