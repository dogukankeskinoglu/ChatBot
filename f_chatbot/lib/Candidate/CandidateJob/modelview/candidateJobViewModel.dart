
import 'package:f_chatbot/Candidate/CandidateJob/model/candidateJobModel.dart';
import 'package:f_chatbot/Candidate/CandidateJob/view/candidateJob.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/component/toast/toastmessage.dart';
import 'package:f_chatbot/core/enum/customOrder.dart';
import 'package:f_chatbot/core/enum/jobAction.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:flutter/material.dart';

abstract class CandidateJobViewModel extends BaseStateFull<CandidateJob>{
  String dropdownValue = CustomOrderEnums.puan_artan.text;
  DateTime today = new DateTime.now();
  late List<CandidateJobModel> jobList;
  late List<CandidateJobModel> jobListApply = [];
  List<int> selectedCardIndexList = [];
  List<Widget> widgetOptions = [];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    jobList = [
      CandidateJobModel(
          "Machine Learning-Part Time",
          "DataBoss Security& Analytics A.S",
          "Ankara Turkey",
          today.subtract(new Duration(days: 4)),
          97,
          JobActionEnum.accept),
      CandidateJobModel(
        "Data Intern",
        "Scoutium",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 3)),
        90,
        JobActionEnum.not_apply,
      ),
      CandidateJobModel(
        "TR-Specialist",
        "Apple",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 10)),
        50,
        JobActionEnum.not_apply,
      ),
      CandidateJobModel(
        "Yazılım Uzmanı",
        "HUGO, BOSS",
        "Izmir Turkey",
        today.subtract(new Duration(days: 30)),
        70,
        JobActionEnum.not_apply,
      ),
      CandidateJobModel(
        "Veri Bilimi ve AnalitiGi Uzmanı",
        "Vestel",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 65)),
        80,
        JobActionEnum.apply,
      ),
      CandidateJobModel(
          "Deep Learning-Part Time",
          "DataBoss Security& Analytics A.S",
          "İstanbul Turkey",
          today.subtract(new Duration(days: 60)),
          70,
          JobActionEnum.apply),
      CandidateJobModel(
        "TR-Specialist",
        "Apple",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 10)),
        20,
        JobActionEnum.refuse,
      ),
      CandidateJobModel(
        "Yazılım Uzmanı",
        "HUGO, BOSS",
        "Izmir Turkey",
        today.subtract(new Duration(days: 30)),
        45,
        JobActionEnum.refuse,
      ),
      CandidateJobModel("Big Data", "DataBoss Security& Analytics A.S", "Ankara Turkey",
          today.subtract(new Duration(days: 60)), 65, JobActionEnum.not_apply),
    ];
    orderByMatch(CustomOrderEnums.puan_azalan);
  }

  void orderByMatch(CustomOrderEnums ce) {
    switch (ce) {
      case CustomOrderEnums.puan_artan:
        jobList.sort((a, b) => a.matchRate.compareTo(b.matchRate));
        break;
      case CustomOrderEnums.puan_azalan:
        jobList.sort((a, b) => b.matchRate.compareTo(a.matchRate));
        break;
      case CustomOrderEnums.sirket_artan:
        jobList.sort((a, b) => a.companyName.compareTo(b.companyName));
        break;
      case CustomOrderEnums.sirket_azalan:
        jobList.sort((a, b) => b.companyName.compareTo(a.companyName));
        break;
      case CustomOrderEnums.domain_artan:
        jobList.sort((a, b) => a.domainName.compareTo(b.domainName));
        break;
      case CustomOrderEnums.domain_azalan:
        jobList.sort((a, b) => b.domainName.compareTo(a.domainName));
        break;
      case CustomOrderEnums.tarih_artan:
        jobList.sort((a, b) => a.time.compareTo(b.time));
        break;
      case CustomOrderEnums.tarih_azalan:
        jobList.sort((a, b) => b.time.compareTo(a.time));
        break;
      default:
        jobList.sort((a, b) => b.time.compareTo(a.time));
        break;
    }
  }

  dismissSlidableItem(
      BuildContext context, CandidateJobModel item, JobActionEnum action) {
    switch (action) {
      case JobActionEnum.apply:
        if (item.jobSituation == JobActionEnum.apply) {
          buildFlutterToast(ApplicationStrings.instance.jobAlreadyApply);
        } else if (item.jobSituation == JobActionEnum.refuse) {
          buildFlutterToast(ApplicationStrings.instance.jobAlreadyRefuse);
        } else if (item.jobSituation == JobActionEnum.accept) {
          buildFlutterToast(ApplicationStrings.instance.jobAlreadyAccept);
        } else {
          jobListApply.add(item);
          item.jobSituation = JobActionEnum.apply;
        }
        break;
      case JobActionEnum.not_apply:
        if (item.jobSituation == JobActionEnum.not_apply) {
          buildFlutterToast(ApplicationStrings.instance.jobAlreadyNotApply);
        } else if (item.jobSituation == JobActionEnum.refuse) {
          buildFlutterToast(ApplicationStrings.instance.jobAlreadyRefuse);
        } else if (item.jobSituation == JobActionEnum.accept) {
          buildFlutterToast(ApplicationStrings.instance.jobAlreadyAccept);
        } else {
          jobListApply.remove(item);
          item.jobSituation = JobActionEnum.not_apply;
        }
        break;
      default:
        throw Exception("Unknow");
    }
  }
}