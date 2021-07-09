import 'package:flutter/material.dart';

import 'candidateJobView.dart';

class CandidateJob extends StatefulWidget {
  final String candidateName;

  const CandidateJob({Key? key, required this.candidateName}) : super(key: key);
  
  @override
  CandidateJobView createState() => CandidateJobView(candidateName);
}
