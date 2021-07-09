import 'package:f_chatbot/core/enum/companyEnum.dart';
import 'package:f_chatbot/core/enum/companyType.dart';
import 'package:f_chatbot/core/enum/education.dart';
import 'package:f_chatbot/core/enum/jobType.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:f_chatbot/core/enum/university.dart';
import 'package:f_chatbot/core/enum/universityDepartment.dart';
import 'package:flutter/material.dart';

class ChatBotModel extends ChangeNotifier {
  String selectedCityValue = CityLocation.ADANA.cityName;
  String selectedBirthCityValue = CityLocation.ADANA.cityName;
  String selectedEducationValue = EducationTypeEnum.LISANSAKTIF.educationType;
  String selectedSector = SectorEnums.Yazilim.sectorText;
  String selectedCompany = CompanyEnum.TRENDYOL.companyName;
  String selectedPrevCompany = CompanyEnum.TRENDYOL.companyName;
  String selectedPrevSector = SectorEnums.Yazilim.sectorText;
  String selectedDesireSector = SectorEnums.Yazilim.sectorText;
  String selectedCompanyType = CompanyTypeEnum.KUCUK.companyType;
  String selectedJobType = JobTypeEnum.PARTTIME.jobType;
  String selectedUniversity = UniversityEnum.EGE.universityName;
  String selectedUniversityDepartment =
      UniversityDepartmentEnum.COMPUTER.universityDepartmentName;

  void changeCityValue(String newCityName) {
    selectedCityValue = newCityName;
    notifyListeners();
  }

  void changeBirthCityValue(String newBirthCity) {
    selectedBirthCityValue = newBirthCity;
    notifyListeners();
  }

  void changeEducationValue(String newEducation) {
    selectedEducationValue = newEducation;
    notifyListeners();
  }

  void changeSector(String newSector) {
    selectedSector = newSector;
    notifyListeners();
  }

  void changePrevSector(String newPrevSector) {
    selectedPrevSector = newPrevSector;
    notifyListeners();
  }

  void changeDesireSector(String desireSector) {
    selectedDesireSector = desireSector;
    notifyListeners();
  }

  void changeCompany(String newCompany) {
    selectedCompany = newCompany;
    notifyListeners();
  }

  void changePrevCompany(String newPrevCompany) {
    selectedPrevCompany = newPrevCompany;
    notifyListeners();
  }

  void changeCompanyType(String newCompanyType) {
    selectedCompanyType = newCompanyType;
    notifyListeners();
  }

  void changeJobType(String newJobType) {
    selectedJobType = newJobType;
    notifyListeners();
  }

  void changeUniversity(String newUniversity) {
    selectedUniversity = newUniversity;
    notifyListeners();
  }

  void changeUniversityDepartment(String newUniversityDepartment) {
    selectedUniversityDepartment = newUniversityDepartment;
    notifyListeners();
  }
}
