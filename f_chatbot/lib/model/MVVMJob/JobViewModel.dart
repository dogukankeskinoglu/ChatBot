import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/component/toast/toastmessage.dart';
import 'package:f_chatbot/core/enum/customOrder.dart';
import 'package:f_chatbot/core/enum/jobAction.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:f_chatbot/model/MVVMJob/Job.dart';

import 'package:f_chatbot/model/job_model.dart';
import 'package:flutter/material.dart';

abstract class JobViewModel extends BaseStateFull<Job> {
  String dropdownValue = CustomOrderEnums.puan_artan.text;
  DateTime today = new DateTime.now();
  late List<JobModel> jobList;
  late List<JobModel> jobListApply = [];
  List<int> selectedCardIndexList = [];
  List<Widget> widgetOptions = [];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    jobList = [
      JobModel(
          "Machine Learning-Part Time",
          "DataBoss Security& Analytics A.Ş",
          "Ankara Turkey",
          today.subtract(new Duration(days: 4)),
          99,
          JobActionEnum.not_apply),
      JobModel(
        "Data Intern",
        "Scoutium",
        "İstanbul Turkey",
        today.subtract(new Duration(days: 3)),
        80,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "TR-Specialist",
        "Apple",
        "İstanbul Turkey",
        today.subtract(new Duration(days: 10)),
        99,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "Yazılım Uzmanı",
        "HUGO, BOSS",
        "İzmir Turkey",
        today.subtract(new Duration(days: 30)),
        55,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "Veri Bilimi ve Analitiği Uzmanı",
        "Vestel",
        "İstanbul Turkey",
        today.subtract(new Duration(days: 65)),
        65,
        JobActionEnum.refuse,
      ),
      JobModel(
          "Machine Learning-Part Time",
          "DataBoss Security& Analytics A.Ş",
          "Ankara Turkey",
          today.subtract(new Duration(days: 60)),
          10,
          JobActionEnum.accept),
      JobModel(
        "TR-Specialist",
        "Apple",
        "İstanbul Turkey",
        today.subtract(new Duration(days: 10)),
        99,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "Yazılım Uzmanı",
        "HUGO, BOSS",
        "İzmir Turkey",
        today.subtract(new Duration(days: 30)),
        55,
        JobActionEnum.refuse,
      ),
      JobModel(
        "Veri Bilimi ve Analitiği Uzmanı",
        "Vestel",
        "İstanbul Turkey",
        today.subtract(new Duration(days: 65)),
        65,
        JobActionEnum.not_apply,
      ),
      JobModel(
          "Machine Learning-Part Time",
          "DataBoss Security& Analytics A.Ş",
          "Ankara Turkey",
          today.subtract(new Duration(days: 60)),
          10,
          JobActionEnum.not_apply),
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
      BuildContext context, JobModel item, JobActionEnum action) {
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
          print(jobListApply.length);
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
