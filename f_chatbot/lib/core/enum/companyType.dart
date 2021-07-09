enum CompanyTypeEnum {
  BUYUK,
  ORTALAMA,
  KUCUK,
}

extension CompanyTypeEnumPath on CompanyTypeEnum {
  String get companyType {
    switch (this) {
      case CompanyTypeEnum.BUYUK:
        return "BÜYÜK ŞİRKET";
      case CompanyTypeEnum.ORTALAMA:
        return "ORTALAMA  ŞİRKET";
      case CompanyTypeEnum.KUCUK:
        return "KÜÇÜK ŞİRKET";
      default:
        return "UNKNOWN ";
    }
  }
}
