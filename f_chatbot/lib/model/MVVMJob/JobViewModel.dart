import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/model/MVVMJob/Job.dart';

import 'package:f_chatbot/model/job_model.dart';

abstract class JobViewModel extends BaseStateFull<Job> {
  late final List<JobModel> jobList;
  List<int> selectedIndex = [];
  @override
  void initState() {
    super.initState();
    jobList = [
      JobModel("Machine Learning-Part Time", "DataBoss Security& Analytics A.Ş",
          "Ankara Turkey", "3 Gün Önce", "100"),
      JobModel(
          "Data Intern", "Scoutium", "İstanbul Turkey", "4 Gün Önce", "75"),
      JobModel(
          "TR-Specialist", "Apple", "İstanbul Turkey", "1 Hafta Önce", "60"),
      JobModel(
          "Yazılım Uzmanı", "HUGO, BOSS", "İzmir Turkey", "2 Hafta Önce", "55"),
      JobModel("Veri Bilimi ve Analitiği Uzmanı", "Vestel", "İstanbul Turkey",
          "1 ay Önce", "45"),
      JobModel("Machine Learning-Part Time", "DataBoss Security& Analytics A.Ş",
          "Ankara Turkey", "3 Gün Önce", "100"),
      JobModel(
          "Data Intern", "Scoutium", "İstanbul Turkey", "4 Gün Önce", "75"),
      JobModel(
          "TR-Specialist", "Apple", "İstanbul Turkey", "1 Hafta Önce", "60"),
      JobModel(
          "Yazılım Uzmanı", "HUGO, BOSS", "İzmir Turkey", "2 Hafta Önce", "55"),
      JobModel("Veri Bilimi ve Analitiği Uzmanı", "Vestel", "İstanbul Turkey",
          "1 ay Önce", "45"),
      JobModel("Machine Learning-Part Time", "DataBoss Security& Analytics A.Ş",
          "Ankara Turkey", "3 Gün Önce", "100"),
      JobModel(
          "Data Intern", "Scoutium", "İstanbul Turkey", "4 Gün Önce", "75"),
      JobModel(
          "TR-Specialist", "Apple", "İstanbul Turkey", "1 Hafta Önce", "60"),
      JobModel(
          "Yazılım Uzmanı", "HUGO, BOSS", "İzmir Turkey", "2 Hafta Önce", "55"),
      JobModel("Veri Bilimi ve Analitiği Uzmanı", "Vestel", "İstanbul Turkey",
          "1 ay Önce", "45"),
    ];
  }
}
