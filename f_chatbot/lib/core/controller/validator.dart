String? isPasswordValid(String text) =>
    text.length >= 6 ? null : "Lütfen doğru formatta giriniz";

String? isValidateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? "Lütfen Geçerli email giriniz" : null;
}

String? isValidOther(String value) {
  if (value.isEmpty) {
    return "Girilen değer boş olamaz";
  }
  return null;
}
