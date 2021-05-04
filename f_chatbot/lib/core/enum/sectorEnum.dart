enum SectorEnums {
  Satis,
  Uretim,
  Pazarlama,
  BilgiTeknolojileri,
  Yazilim,
  Danismanlik,
  Arge
}

extension SectorEnumPath on SectorEnums {
  String get sectorText {
    switch (this) {
      case SectorEnums.Arge:
        return "ARGE";
      case SectorEnums.Satis:
        return "SATIŞ";
      case SectorEnums.Pazarlama:
        return "PAZARLAMA";
      case SectorEnums.BilgiTeknolojileri:
        return "BİLGİ TEKNOLOJİLERİ";
      case SectorEnums.Yazilim:
        return "YAZILIM";
      case SectorEnums.Danismanlik:
        return "DANIŞMANLIK";
      case SectorEnums.Uretim:
        return "URETIM";
      default:
        return "UNKNOWN";
    }
  }
}
