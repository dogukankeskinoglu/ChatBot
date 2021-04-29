

import 'package:f_chatbot/core/exception/userenum_exception.dart';

enum UserEnum {
  Candidate,
  Company,
}

extension UserEnumPath on UserEnum {
  String get type {
    switch (this) {
      case UserEnum.Candidate:
        return "candidate";
      case UserEnum.Company:
        return "company";
      default:
        return throw UserEnumException(this);
    }
  }
}
