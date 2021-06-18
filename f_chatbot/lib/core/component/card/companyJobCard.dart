import 'package:f_chatbot/Company/CompanyJob/CreateJob/model/CompanyJob.dart';
import 'package:flutter/material.dart';

class CompanyJobCard extends StatelessWidget {
  final CompanyJob companyJob;
  final int index;
  CompanyJobCard(this.companyJob, this.index);
  @override
  Card build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(index.toString()),
        ),
        title: Text(companyJob.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(companyJob.location),
            Text(companyJob.time.toIso8601String()),
          ],
        ),
      ),
    );
  }
}
