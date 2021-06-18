import 'package:f_chatbot/Company/CompanyJob/CreateJob/view/CompanyCreateJob.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:flutter/material.dart';

abstract class CompanyCreateJobViewModel
    extends BaseStateFull<CompanyCreateJob> {
  TextEditingController tcTitle = TextEditingController();
  TextEditingController tcDescription = TextEditingController();
  String selectedCityValue = CityLocation.ADANA.cityName;
  String selectedSector = SectorEnums.Yazilim.sectorText;
  UnauthenticatedEnum jobState = UnauthenticatedEnum.FAIL;
  final formKey = GlobalKey<FormState>();

  void saveButton() {
    print(tcTitle.text);
    print(tcDescription.text);
    setState(() {
      if (formKey.currentState!.validate()) {
        jobState = UnauthenticatedEnum.SUCCESSFULL;
      }
    });
  }
}
