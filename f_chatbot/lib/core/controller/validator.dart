String? isPasswordValid(String text) {
  if (text.isEmpty)
    return "Girilen Yer Boş olamaz";
  else if (text.length < 6)
    return "6 karakterden uzun olmalıdır";
  else if (text.length > 15) return "15 karakterden az olmalıdır";
  return null;
}

String? isValidateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? "Lutfen gecerli email giriniz" : null;
}

String? isEmptyValue(String value) {
  if (value.isEmpty) {
    return "Girilen Yer Boş olamaz";
  }
  return null;
}

String? isValidPhone(String value) {
  if (value.isEmpty) {
    return "Girilen Yer Boş olamaz";
  } else if (value.contains(RegExp(r'[A-Za-z]'))) {
    return "Lütfen harf girmeyiniz";
  } else if (value.length != 11) {
    return "Lütfen 11 uzunluklu telefon giriniz.Uzunluk:${value.length}";
  }

  return null;
}
