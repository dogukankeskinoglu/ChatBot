import 'package:f_chatbot/Company/CompanyInformation/view/companyInformation.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:flutter/material.dart';

abstract class CompanyInformationViewModel extends BaseStateFull<CompanyInformations> {
  String selectedCityValue = CityLocation.ADANA.cityName;
  DateTime selectedDate = DateTime.now();
  String selectedSector = SectorEnums.Yazilim.sectorText;
  DateTime today = DateTime.now();
  UnauthenticatedEnum informationState = UnauthenticatedEnum.FAIL;
  TextEditingController tcCompanyName = TextEditingController();
  TextEditingController tcCompanyDescription = TextEditingController();
  TextEditingController tcCompanyTelephone = TextEditingController();
  TextEditingController tcCompanyEmail = TextEditingController();
  TextEditingController tcCmpanyWebsite = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void saveButton() {
    /*print(tcCompanyName.text);
    print(tcCompanyDescription.text);
    print(tcCompanyTelephone.text);
    print(tcCompanyEmail.text);
    print(tcCmpanyWebsite.text);
    print(selectedCityValue);
    print(selectedDate);
    print(selectedSector);*/
    setState(() {
      if (formKey.currentState!.validate()) {
        informationState = UnauthenticatedEnum.SUCCESSFULL;
      }
    });
  }
}
