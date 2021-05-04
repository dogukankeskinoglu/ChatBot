import 'package:f_chatbot/page/company/company_joblist.dart';
import 'package:f_chatbot/page/company/company_setting.dart';
import 'package:flutter/material.dart';

class CompanyHome extends StatefulWidget {
  final String companyName;

  const CompanyHome({Key? key, required this.companyName}) : super(key: key);

  @override
  _CompanyHomeState createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  static List<Widget> widgetOptions = <Widget>[
    CompanyInformationPage(),
    CompanyJobPage()
  ];
  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = 0;
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: widgetOptions[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Job"),
        ],
        currentIndex: selectedIndex,
        onTap: (value) => onItemTapped(value),
      ),
    );
  }
}
