import 'dart:ffi';

import 'package:f_chatbot/Company/candidateModel.dart';
import 'package:f_chatbot/core/component/circular_percantege/circular_percantage.dart';
import 'package:flutter/material.dart';

class CandidateCard extends StatelessWidget {
  final CandidateModel candidate;
  final int index;

  const CandidateCard(
      {Key? key, required this.candidate, required this.index})
      : super(key: key);

  @override
  Card build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(index.toString()),
        ),
        title: Text(candidate.name),
        trailing: CircularPercantageWidget(radius: candidate.matchrate),
      ),
    );
  }
}
