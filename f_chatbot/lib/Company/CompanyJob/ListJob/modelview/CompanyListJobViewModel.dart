import 'package:f_chatbot/Company/CompanyJob/CreateJob/model/CompanyJob.dart';
import 'package:f_chatbot/Company/CompanyJob/ListJob/view/CompanyJobState.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';

abstract class CompanyListJobViewModel
    extends BaseStateFull<CompanyJobState> {

  List<CompanyJob> companyJobs = [
    CompanyJob("Company", SectorEnums.Yazilim.sectorText, "Mobile Developer", "Android,Kotlin", CityLocation.ANKARA.cityName, DateTime.now()),
    CompanyJob("Company", SectorEnums.Yazilim.sectorText, ".NET Developer", "C#", CityLocation.IZMIR.cityName, DateTime.now()),
    CompanyJob("Company", SectorEnums.Yazilim.sectorText, "Backend Developer", "Node js,Dart", CityLocation.ISTANBUL.cityName, DateTime.now()),
  ];

}