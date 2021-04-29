import 'package:f_chatbot/core/component/button/elevatedButton.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/jobPage");
                },
                text: "Job Page"),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/loginPersonal");
                },
                text: "Login Candidate Page"),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/loginCompany");
                },
                text: "Login Company Page"),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/loginHome");
                },
                text: "Login Home Page"),
          ],
        ),
      ),
    );
  }
}
