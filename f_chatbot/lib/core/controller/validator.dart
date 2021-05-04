String? isPasswordValid(String text) =>
    text.length >= 6 ? null : "LUtfen doGru formatta giriniz";

String? isValidateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? "LUtfen GeCerli email giriniz" : null;
}

String? isValidOther(String value) {
  if (value.isEmpty) {
    return "Girilen deGer boS olamaz";
  }
  return null;
}
