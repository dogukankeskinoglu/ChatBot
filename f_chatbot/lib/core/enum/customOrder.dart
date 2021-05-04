import 'package:f_chatbot/model/job_model.dart';

enum CustomOrderEnums {
  tarih_azalan,
  tarih_artan,
  domain_artan,
  domain_azalan,
  sirket_azalan,
  sirket_artan,
  puan_azalan,
  puan_artan,
  basvurulan,
  reddedildi,
  kabuledilen,
  basvurulmayan
}

extension CustomOrderEnumsExtension on CustomOrderEnums {
  String get text {
    switch (this) {
      case CustomOrderEnums.tarih_azalan:
        return "Tarihe göre azalan";
      case CustomOrderEnums.tarih_artan:
        return "Tarihe göre artan";
      case CustomOrderEnums.domain_artan:
        return "Domaine göre artan";
      case CustomOrderEnums.domain_azalan:
        return "Domaine göre azalan";
      case CustomOrderEnums.sirket_azalan:
        return "Sirket göre azalan";
      case CustomOrderEnums.sirket_artan:
        return "Sirket göre artan";
      case CustomOrderEnums.puan_azalan:
        return "Puana göre azalan";
      case CustomOrderEnums.puan_artan:
        return "Puana göre artan";
      case CustomOrderEnums.basvurulan:
        return "Basvuralana göre";
      case CustomOrderEnums.reddedildi:
        return "Reddedilene göre";
      case CustomOrderEnums.kabuledilen:
        return "Kabul edilene göre ";
      case CustomOrderEnums.basvurulmayan:
        return "BaSvurulmayan ilana göre";
      default:
        throw Exception("Bilinmeyen sıralama $this");
    }
  }
}
