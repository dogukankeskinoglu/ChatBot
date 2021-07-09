enum UniversityDepartmentEnum {
  COMPUTER,
  CIVIL,
  ELECTRICAL,
  MACHINE,
  MATHEMATICAL,
  INDUSTRY,
  BIO,
  MIMAR,
  GASTRONOMI,
  GIDA,
  GRAFIK,
  CHEMICAL,
  MADEN,
  STATISTICS,
  ADVERTISEMENT,
}

extension UniversityDepartmentEnumPath on UniversityDepartmentEnum {
  String get universityDepartmentName {
    switch (this) {
      case UniversityDepartmentEnum.COMPUTER:
        return "Bilgisayar Mühendisliği";
      case UniversityDepartmentEnum.BIO:
        return "Biyomühendislik";
      case UniversityDepartmentEnum.ADVERTISEMENT:
        return "Reklamcılık";
      case UniversityDepartmentEnum.STATISTICS:
        return "İstatistik";
      case UniversityDepartmentEnum.CIVIL:
        return "İNŞAAT MÜHENDİSLİĞİ";
      case UniversityDepartmentEnum.ELECTRICAL:
        return "Elektrik Elektronik Mühendisliği";
      case UniversityDepartmentEnum.CHEMICAL:
        return "Kimya Mühendisliği";
      case UniversityDepartmentEnum.GASTRONOMI:
        return "Gastronomi";
      case UniversityDepartmentEnum.GRAFIK:
        return "Grafik Tasarım";
      case UniversityDepartmentEnum.GIDA:
        return "Gıda Mühendisliği";
      case UniversityDepartmentEnum.MIMAR:
        return "Mimarlık";
      case UniversityDepartmentEnum.MACHINE:
        return "Makine Mühendisliği";
      case UniversityDepartmentEnum.MADEN:
        return "Maden Mühendisliği";
      case UniversityDepartmentEnum.MATHEMATICAL:
        return "Matematik";
      case UniversityDepartmentEnum.INDUSTRY:
        return "Endüstri Mühendisliği";
      default:
        return "UNKNOWN";
    }
  }
}
