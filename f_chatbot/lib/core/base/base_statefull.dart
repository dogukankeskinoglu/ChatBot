import 'package:flutter/material.dart';


abstract class BaseStateFull<T extends StatefulWidget> extends State<T> {
  //ApplicationStrings applicationStrings = ApplicationStrings.instance;
  TextTheme get textTheme => Theme.of(context).textTheme;
  ThemeData get theme => Theme.of(context);
  ColorScheme get colorSchema => Theme.of(context).colorScheme;
  //ImageConstants get imageConstants => ImageConstants.instance;
  EdgeInsets get insetsAll => EdgeInsets.all(30);
  double dynamicHeight(double val) => MediaQuery.of(context).size.height * val;
  double dynamicWidth(double val) => MediaQuery.of(context).size.width * val;
}
