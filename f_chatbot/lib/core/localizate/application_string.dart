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
  final String signup = "SIGNUP";
  final String loginHomeCompany = UserEnum.Company.type;
  final String loginHomeCandidate = UserEnum.Candidate.type;
  final String inputNameHint = "Name";
  final String inputCompanyNameHint = "Company Name";
  final String inputSurnameHint = "Surname";
  final String inputUsernameHint = "Username";
  final String inputEmailHint = "Email";
  final String inputCompanyHint = "Company";
  final String inputPasswordHint = "Password";
  final String appTitle = 'Welcome Our Chatbot';
  final String hesapYokMu = "Hesabınız yok mu?";
  final String hesapVarMi = "Hesabınız var mı?";
  final String hesapGiris = "Giriş yapın";
  final String hesapOlustur = "Hesap oluşturun";
  final String jobPageTitle = 'Senin için bunları buldum';
  final String jobSearchTitle = 'Sirketi giriniz';
  final String jobAlreadyApply = "Ilana önceden başvurdunuz";
  final String jobAlreadyNotApply =
      "BaşvurduGunuz ilanları iptal edebilirsiniz";
  final String jobAlreadyRefuse = "Reddedildiğiniz ilana işlem yapamazsınız";
  final String jobAlreadyAccept = "Bu iş ilanından zaten randevu aldınız";
  final String companyInformation = "Set Company Information";
  final String companyJob = "Show Job";
}
