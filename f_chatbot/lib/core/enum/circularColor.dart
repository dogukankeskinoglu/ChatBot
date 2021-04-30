import 'package:flutter/material.dart';

enum CircularPercantageColorEnum {
  firstQuarter,
  secondQuarter,
  thirdQuarter,
  fourthQuarter
}

extension CircularPercantageExtendions on CircularPercantageColorEnum {
  Color get color {
    switch (this) {
      case CircularPercantageColorEnum.firstQuarter:
        return Color.fromARGB(0, 4, 46, 76);
      case CircularPercantageColorEnum.secondQuarter:
        return Color.fromARGB(64, 4, 46, 76);
      case CircularPercantageColorEnum.thirdQuarter:
        return Color.fromARGB(128, 4, 46, 76);
      case CircularPercantageColorEnum.fourthQuarter:
        return Color.fromARGB(255, 4, 46, 76);
      default:
        return Colors.white;
    }
  }

  
}
