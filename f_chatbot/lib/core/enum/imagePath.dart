import 'package:f_chatbot/core/exception/image_exception.dart';

enum ImagePathEnums {
  CompanyImage,
  CandidateImage,
  CandidateLoginWallPaper,
  CompanyLoginWallPaper,
  CompanyInformationImage,
  CompanyJobImage,
  CreateJobImage,
}

extension ImagePathExtension on ImagePathEnums {
  String get img {
    switch (this) {
      case ImagePathEnums.CompanyImage:
        return "assets/images/company.png";
      case ImagePathEnums.CandidateImage:
        return "assets/images/candidate.png";
      case ImagePathEnums.CandidateLoginWallPaper:
        return "assets/images/employeelogin.jpg";
      case ImagePathEnums.CompanyLoginWallPaper:
        return "assets/images/companyloginpage.png";
      case ImagePathEnums.CompanyInformationImage:
        return "assets/images/companyInformation.png";
      case ImagePathEnums.CompanyJobImage:
        return "assets/images/companyJob.png";
      case ImagePathEnums.CreateJobImage:
        return "assets/images/createjob.png";
      default:
        throw ImagePathException(this);
    }
  }
}
