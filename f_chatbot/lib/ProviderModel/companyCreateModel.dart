import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompanyCreateModel extends ChangeNotifier {
  String selectedCityValue = CityLocation.ADANA.cityName;
  DateTime selectedDate = DateTime.now();
  String selectedSector = SectorEnums.Yazilim.sectorText;

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
}
