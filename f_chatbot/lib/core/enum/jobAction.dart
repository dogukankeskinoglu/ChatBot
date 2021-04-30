import 'package:flutter/material.dart';

enum JobActionEnum { apply, not_apply, accept, refuse }

extension JobActionColorEnum on JobActionEnum {
  Color? get color {
    switch (this) {
      case JobActionEnum.apply:
        return Colors.blue;
      case JobActionEnum.refuse:
        return Colors.red;
      case JobActionEnum.not_apply:
        return Colors.grey;
      case JobActionEnum.accept:
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}
