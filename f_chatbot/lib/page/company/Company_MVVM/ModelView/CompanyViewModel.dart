import 'package:f_chatbot/core/enum/jobAction.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:f_chatbot/Job/model/job_model.dart';
import 'package:flutter/material.dart';

class CompanyViewModel extends ChangeNotifier {
  final String companyName;
  List<JobModel>? jobs = null;
  String selectedCityValue = CityLocation.ADANA.cityName;
  DateTime selectedDate = DateTime.now();
  String selectedSector = SectorEnums.Yazilim.sectorText;
  DateTime today = DateTime.now();
  

  TextEditingController tcCompanyName = TextEditingController();
  TextEditingController tcCompanyDescription = TextEditingController();
  TextEditingController tcCompanyTelephone = TextEditingController();
  TextEditingController tcCompanyEmail = TextEditingController();
  TextEditingController tcCmpanyWebsite = TextEditingController();
  final formKey = GlobalKey<FormState>();

  CompanyViewModel(this.companyName);

  void changeCityValue(String newCityName) {
    selectedCityValue = newCityName;
    notifyListeners();
  }

  void changeDate(DateTime? newDate) {
    selectedDate = newDate == null ? DateTime.now() : newDate;
    notifyListeners();
  }

  void changeSector(String newSector) {
    selectedSector = newSector;
    notifyListeners();
  }

  void getJobList() {
    jobs = [
      JobModel(
          "Machine Learning-Part Time",
          "DataBoss Security& Analytics A.S",
          "Ankara Turkey",
          today.subtract(new Duration(days: 4)),
          99,
          JobActionEnum.not_apply),
      JobModel(
        "Data Intern",
        "Scoutium",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 3)),
        80,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "TR-Specialist",
        "Apple",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 10)),
        99,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "Yazılım Uzmanı",
        "HUGO, BOSS",
        "Izmir Turkey",
        today.subtract(new Duration(days: 30)),
        55,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "Veri Bilimi ve AnalitiGi Uzmanı",
        "Vestel",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 65)),
        65,
        JobActionEnum.refuse,
      ),
      JobModel(
          "Machine Learning-Part Time",
          "DataBoss Security& Analytics A.S",
          "Ankara Turkey",
          today.subtract(new Duration(days: 60)),
          10,
          JobActionEnum.accept),
      JobModel(
        "TR-Specialist",
        "Apple",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 10)),
        99,
        JobActionEnum.not_apply,
      ),
      JobModel(
        "Yazılım Uzmanı",
        "HUGO, BOSS",
        "Izmir Turkey",
        today.subtract(new Duration(days: 30)),
        55,
        JobActionEnum.refuse,
      ),
      JobModel(
        "Veri Bilimi ve AnalitiGi Uzmanı",
        "Vestel",
        "Istanbul Turkey",
        today.subtract(new Duration(days: 65)),
        65,
        JobActionEnum.not_apply,
      ),
      JobModel(
          "Machine Learning-Part Time",
          "DataBoss Security& Analytics A.S",
          "Ankara Turkey",
          today.subtract(new Duration(days: 60)),
          10,
          JobActionEnum.not_apply),
    ];
    notifyListeners();
  }
}
