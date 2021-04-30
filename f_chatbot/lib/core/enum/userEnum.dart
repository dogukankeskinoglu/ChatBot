

import 'package:f_chatbot/core/exception/userenum_exception.dart';

enum UserEnum {
  Candidate,
  Company,
}

extension UserEnumPath on UserEnum {
  String get type {
    switch (this) {
      case UserEnum.Candidate:
        return "Candidate";
      case UserEnum.Company:
        return "Company";
      default:
        return throw UserEnumException(this);
    }
  }
}
