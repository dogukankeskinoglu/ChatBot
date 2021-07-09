enum SectorEnums {
  Satis,
  Uretim,
  Pazarlama,
  BilgiTeknolojileri,
  Yazilim,
  Danismanlik,
  Arge,
  Hizmet,
}

extension SectorEnumPath on SectorEnums {
  String get sectorText {
    switch (this) {
      case SectorEnums.Arge:
        return "arge";
      case SectorEnums.Satis:
        return "satış";
      case SectorEnums.Hizmet:
        return "hizmet";
      case SectorEnums.Pazarlama:
        return "pazarlama";
      case SectorEnums.BilgiTeknolojileri:
        return "bilgi teknolojileri";
      case SectorEnums.Yazilim:
        return "yazılım";
      case SectorEnums.Danismanlik:
        return "danışmanlık";
      case SectorEnums.Uretim:
        return "üretim";
      default:
        return "UNKNOWN";
    }
  }
}
