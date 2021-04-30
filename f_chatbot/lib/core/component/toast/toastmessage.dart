import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future<void> buildFlutterToast(String message) {
  return Fluttertoast.showToast(
      msg: message, gravity: ToastGravity.CENTER, textColor: Colors.red);
}
