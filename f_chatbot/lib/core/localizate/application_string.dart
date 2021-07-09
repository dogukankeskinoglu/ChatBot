import 'package:f_chatbot/core/enum/userEnum.dart';

class ApplicationStrings {
  static ApplicationStrings? _instace;
  static ApplicationStrings get instance {
    if (_instace != null) return _instace!;
    _instace = ApplicationStrings._init();
    return _instace!;
  }

  ApplicationStrings._init();

  final String login = 'Giriş';
  final String finishConversition = "İşleri göster";
  final String signup = "Kayıt olun";
  final String loginHomeCompany = UserEnum.Company.type;
  final String loginHomeCandidate = UserEnum.Candidate.type;
  final String inputNameSurnameHint = "Ad Soyad";
  final String inputCompanyNameHint = "Şirket İsmi";
  final String inputUsernameHint = "Kullanıcı adı";
  final String inputEmailHint = "Email";
  final String inputCompanyHint = "Şirket kullanıcı adı";
  final String inputPasswordHint = "Şifre";
  final String appTitle = 'HR Bot';
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
  final String companyInformation = "Şirket Bilgilerini Düzenle";
  final String companyJob = "İlanları göster";
  final String createJob = "İlan oluştur";
  final String saveInformation = "İlan bilgilerini kaydet";
}
