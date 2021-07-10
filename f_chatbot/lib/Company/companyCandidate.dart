import 'package:f_chatbot/Company/CompanyJob/CreateJob/model/CompanyJob.dart';
import 'package:f_chatbot/Company/candidateModel.dart';
import 'package:f_chatbot/core/component/card/candidate.dart';
import 'package:flutter/material.dart';

class CompanyCandidate extends StatefulWidget {
  final CompanyJob job;
  final List<CandidateModel> employees;

  const CompanyCandidate({Key? key, required this.job, required this.employees})
      : super(key: key);

  @override
  _CompanyCandidateState createState() => _CompanyCandidateState();
}

class _CompanyCandidateState extends State<CompanyCandidate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.job.title),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              widget.job.description,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: widget.employees.length,
                  itemBuilder: (context, index) {
                    return CandidateCard(
                        candidate: widget.employees[index], index: index + 1);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
