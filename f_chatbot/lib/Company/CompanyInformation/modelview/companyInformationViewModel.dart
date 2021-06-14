import 'package:f_chatbot/Company/CompanyInformation/view/companyInformation.dart';
import 'package:f_chatbot/Job/model/job_model.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:flutter/material.dart';

abstract class CompanyInformationViewModel extends BaseStateFull<CompanyInformations> {
  List<JobModel>? jobs;
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

  void saveButton() {
    print(tcCompanyName.text);
    print(tcCompanyDescription.text);
    print(tcCompanyTelephone.text);
    print(tcCompanyEmail.text);
    print(tcCmpanyWebsite.text);
    print(selectedCityValue);
    print(selectedDate);
    print(selectedSector);
  }
}
