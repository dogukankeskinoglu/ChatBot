import 'package:f_chatbot/core/enum/userEnum.dart';

class UserEnumException implements Exception {
  final UserEnum type;

  UserEnumException(this.type);
  @override
  String toString() {
    return 'User not found $type';
  }
}
