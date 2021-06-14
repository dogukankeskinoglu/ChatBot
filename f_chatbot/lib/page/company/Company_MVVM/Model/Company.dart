import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';

class Company {
  final String companyName;
  final String companyDescription;
  final String companyTelephone;
  final DateTime companyEmail;
  final double companyWebsite;
  final CityLocation jobSituation;
  final SectorEnums sector;

  Company(
    this.companyName,
    this.companyDescription,
    this.companyTelephone,
    this.companyEmail,
    this.companyWebsite,
    this.jobSituation,
    this.sector,
  );
  
}
