
import 'package:f_chatbot/core/enum/jobAction.dart';

class CandidateJobModel{
  final String domainName;
  final String companyName;
  final String location;
  final DateTime time;
  final double matchRate;
  JobActionEnum jobSituation;

  CandidateJobModel(this.domainName, this.companyName, this.location, this.time,
      this.matchRate, this.jobSituation);
  @override
  String toString() {
    // TODO: implement toString
    return "DomainName:$domainName CompanyName:$companyName Location:${location} Time:$time IsApply:$jobSituation";
  }
}