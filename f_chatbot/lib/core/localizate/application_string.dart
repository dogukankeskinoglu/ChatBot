import 'package:f_chatbot/core/enum/userEnum.dart';

class ApplicationStrings {
  static ApplicationStrings? _instace;
  static ApplicationStrings get instance {
    if (_instace != null) return _instace!;
    _instace = ApplicationStrings._init();
    return _instace!;
  }

  ApplicationStrings._init();

  final String login = 'LOGIN';
  final String loginHomeCompany = UserEnum.Company.type;
  final String loginHomeCandidate = UserEnum.Candidate.type;
  final String appTitle = 'Welcome Our Chatbot';
  final String hesapYokMu = "Hesabınız yok mu?";
  final String hesapOlustur = "Hesap oluşturun";
  final String jobPageTitle = 'Senin için bunları buldum';
  final String jobSearchTitle = 'Şirketi giriniz';
  final String jobAlreadyApply = "İlana önceden başvurdunuz";
  final String jobAlreadyNotApply =
      "Başvurduğunuz ilanları iptal edebilirsiniz";
  final String jobAlreadyRefuse = "Reddedildiğiniz ilana işlem yapamazsınız";
  final String jobAlreadyAccept = "Bu iş ilanından zaten randevu aldınız";
}
