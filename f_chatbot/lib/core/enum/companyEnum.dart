enum CompanyEnum {
  TRENDYOL,
  GARANTI,
  KOC,
  OBSS,
  TURKCELL,
  SOFTTECH,
  SPOTIFY,
}

extension CompanyEnumPath on CompanyEnum {
  String get companyName {
    switch (this) {
      case CompanyEnum.TRENDYOL:
        return "TRENDYOL";
      case CompanyEnum.GARANTI:
        return "GARANTI";
      case CompanyEnum.KOC:
        return "KOC";
      case CompanyEnum.OBSS:
        return "OBSS";
      case CompanyEnum.TURKCELL:
        return "TURKCELL";
      case CompanyEnum.SOFTTECH:
        return "SOFTTECH";
      case CompanyEnum.SPOTIFY:
        return "SPOTIFY";
      default:
        return "UNKNOWN";
    }
  }
}
