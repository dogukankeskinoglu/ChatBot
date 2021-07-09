enum UniversityEnum {
  EGE,
  AKDENIZ,
  BOGAZICI,
  ODTU,
  ITU,
  ULUDAG,
  YILDIZ,
  YASAR,
  CUKUROVA,
  TED,
  MARMARA,
  SULEYMANDEMIREL,
  BAHCESEHIR,
  IU,
  HALIC,
  KOC,
  SABANCI,
  DOKUZEYLUL,
  BEYKOZ,
  ONDOKUZMAYIS,
  USAK,
  ISTANBULAREL,
  ISTANBULOKAN,
  MEF,
  HACETTEPE,
  ATATURK,
  OSMANGAZI,
  GAZI,
  ISTANBULMEDIPOL,
  IZMIREKONOMI,
  KAYSERI,
  TARSUS,
  SAKARYA,
  MIMARSINAN,
}

extension UniversityEnumPath on UniversityEnum {
  String get universityName {
    switch (this) {
      case UniversityEnum.EGE:
        return "Ege Üniversitesi";
      case UniversityEnum.MIMARSINAN:
        return "Mimar Sinan Güzel Sanatlar Üniversitesi";
      case UniversityEnum.SAKARYA:
        return "Sakarya Üniversitesi";
      case UniversityEnum.TARSUS:
        return "Tarsus Üniversitesi";
      case UniversityEnum.KAYSERI:
        return "Kayseri Üniversitesi";
      case UniversityEnum.IZMIREKONOMI:
        return "İzmir Ekonomi Üniversitesi";
      case UniversityEnum.ISTANBULMEDIPOL:
        return "İstanbul Medipol Üniversitesi";
      case UniversityEnum.GAZI:
        return "Gazi Üniversitesi";
      case UniversityEnum.ATATURK:
        return "Atatürk Üniversitesi";
      case UniversityEnum.HACETTEPE:
        return "Hacettepe Üniversitesi";
      case UniversityEnum.MEF:
        return "MEF Üniversitesi";
      case UniversityEnum.ISTANBULOKAN:
        return "İstanbul Okan Üniversitesi";
      case UniversityEnum.OSMANGAZI:
        return "Eskişehir Osmangazi Üniversitesi";
      case UniversityEnum.ISTANBULAREL:
        return "İstanbul Arel Üniversitesi";
      case UniversityEnum.USAK:
        return "Uşak Üniversitesi";
      case UniversityEnum.ONDOKUZMAYIS:
        return "Ondokuz Mayıs Üniversitesi";
      case UniversityEnum.BEYKOZ:
        return "Beykoz Üniversitesi";
      case UniversityEnum.DOKUZEYLUL:
        return "Dokuz Eylül Üniversitesi";
      case UniversityEnum.SABANCI:
        return "Sabancı Üniversitesi";
      case UniversityEnum.AKDENIZ:
        return "Akdeniz Üniversitesi";
      case UniversityEnum.MARMARA:
        return "Marmara Üniversitesi";
      case UniversityEnum.SULEYMANDEMIREL:
        return "Süleyman Demirel Üniversitesi";
      case UniversityEnum.BAHCESEHIR:
        return "Bahçeşehir Üniversitesi";
      case UniversityEnum.IU:
        return "İstanbul Üniversitesi";
      case UniversityEnum.HALIC:
        return "Haliç Üniversitesi";
      case UniversityEnum.KOC:
        return "Koç Üniversitesi";
      case UniversityEnum.TED:
        return "TED Üniversitesi";
      case UniversityEnum.CUKUROVA:
        return "Çukurova Üniversitesi";
      case UniversityEnum.BOGAZICI:
        return "Boğaziçi Üniversitesi";
      case UniversityEnum.ODTU:
        return "Orta Doğu Teknik Üniversitesi";
      case UniversityEnum.ITU:
        return "İstanbul Teknik Üniversitesi";
      case UniversityEnum.ULUDAG:
        return "Uludağ Üniversitesi";
      case UniversityEnum.YILDIZ:
        return "Yıldız Teknik Üniversitesi";
      case UniversityEnum.YASAR:
        return "Yaşar Üniversitesi";
      default:
        return "UNKNOWN";
    }
  }
}
