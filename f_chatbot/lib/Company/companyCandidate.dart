import 'package:flutter/material.dart';

class CompanyCandidate extends StatefulWidget {
  final String jobTitle;
  const CompanyCandidate({Key? key, this.jobTitle = "Job"}) : super(key: key);

  @override
  _CompanyCandidateState createState() => _CompanyCandidateState();
}

class _CompanyCandidateState extends State<CompanyCandidate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jobTitle),
      ),
      body: Center(
        child: Container(
          child: Text("Work In Progress"),
        ),
      ),
    );
  }
}
