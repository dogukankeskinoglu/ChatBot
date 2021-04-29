import 'package:flutter/cupertino.dart';

abstract class BaseStateless<T extends StatelessWidget> extends State {
  //ApplicationStrings applicationStrings = ApplicationStrings.instance;

  //ImageConstants get imageConstants => ImageConstants.instance;
  EdgeInsets get insetsAll => EdgeInsets.all(30);
  double dynamicHeight(double val) => MediaQuery.of(context).size.height * val;
  double dynamicWidth(double val) => MediaQuery.of(context).size.width * val;
}
