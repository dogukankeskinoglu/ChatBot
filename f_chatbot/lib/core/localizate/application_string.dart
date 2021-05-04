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
  final String inputEmailHint = "Email";
  final String inputPasswordHint = "Password";
  final String appTitle = 'Welcome Our Chatbot';
  final String hesapYokMu = "Hesabınız yok mu?";
  final String hesapOlustur = "Hesap oluSturun";
  final String jobPageTitle = 'Senin iCin bunları buldum';
  final String jobSearchTitle = 'Sirketi giriniz';
  final String jobAlreadyApply = "Ilana önceden baSvurdunuz";
  final String jobAlreadyNotApply =
      "BaSvurduGunuz ilanları iptal edebilirsiniz";
  final String jobAlreadyRefuse = "ReddedildiGiniz ilana iSlem yapamazsınız";
  final String jobAlreadyAccept = "Bu iS ilanından zaten randevu aldınız";
}
