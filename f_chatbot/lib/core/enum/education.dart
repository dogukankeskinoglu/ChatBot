enum EducationTypeEnum {
  LISANSAKTIF,
  LISANSMEZUN,
  ILKOKULMEZUN,
  ORTAOKULMEZUN,
  LISEMEZUN,
  LISEAKTIF,
  DOKTARAAKTIF,
  DOKTORAMEZUN,
  YUKSEKLISANSAKTIF,
  YUKSEKLISANSMEZUN,
}

extension EducationTypeEnumPath on EducationTypeEnum {
  String get educationType {
    switch (this) {
      case EducationTypeEnum.LISANSAKTIF:
        return "Üniversite okuyorum";
      case EducationTypeEnum.LISANSMEZUN:
        return "Üniversite mezunuyum";
      case EducationTypeEnum.LISEAKTIF:
        return "Lise okuyorum";
      case EducationTypeEnum.LISEMEZUN:
        return "Lise mezunuyum";
      case EducationTypeEnum.ORTAOKULMEZUN:
        return "Ortaokul mezunuyum";
      case EducationTypeEnum.ILKOKULMEZUN:
        return "İlkokul mezunuyum";
      case EducationTypeEnum.YUKSEKLISANSAKTIF:
        return "Yüksek lisans yapıyorum";
      case EducationTypeEnum.YUKSEKLISANSMEZUN:
        return "Yüksek Lisans";
      case EducationTypeEnum.DOKTORAMEZUN:
        return "Doktara yaptım";
      case EducationTypeEnum.DOKTARAAKTIF:
        return "Doktara yapıyorum";
      default:
        return "UNKNOWN ";
    }
  }
}
