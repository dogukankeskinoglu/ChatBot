import 'package:f_chatbot/core/enum/circularColor.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularPercantageWidget extends StatelessWidget {
  final double radius;

  const CircularPercantageWidget({Key? key, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 45,
      lineWidth: 2,
      percent: radius / 100,
      center: new Text("%${radius.toString()}"),
      progressColor: getColor(),
    );
  }

  Color? getColor() {
    double value = getPercent();
    if (value <= 0.25) {
      return CircularPercantageColorEnum.firstQuarter.color;
    } else if (value <= 0.5) {
      return CircularPercantageColorEnum.secondQuarter.color;
    } else if (value <= 0.75) {
      return CircularPercantageColorEnum.thirdQuarter.color;
    }
    return CircularPercantageColorEnum.fourthQuarter.color;
  }

  double getPercent() => radius / 100;
}
