import 'package:f_chatbot/core/component/circular_percantege/circular_percantage.dart';
import 'package:f_chatbot/model/job_model.dart';
import 'package:flutter/material.dart';

class JobCardWidget extends StatelessWidget {
  final JobModel j_model;
  Color color = Colors.red;
  JobCardWidget(this.j_model, this.color);
  @override
  Card build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            CircularPercantageWidget(radius: double.parse(j_model.matchRate)),
        title: Text(j_model.domainName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(j_model.companyName),
            Text(j_model.location),
            Text(j_model.time)
          ],
        ),
        trailing: Icon(
          Icons.star,
          color: color,
        ),
      ),
    );
  }
}
