
import 'package:f_chatbot/ProviderModel/companyCreateModel.dart';
import 'package:f_chatbot/core/enum/imagePath.dart';
import 'package:f_chatbot/model/MVVMJob/Job.dart';
import 'package:f_chatbot/page/buttonPage.dart';
import 'package:f_chatbot/page/create_account_page/create_account_personal.dart';
import 'package:f_chatbot/page/error_page/unknown_route.dart';
import 'package:f_chatbot/page/home_page/companyHome.dart';
import 'package:f_chatbot/page/login_page/login_home.dart';
import 'package:f_chatbot/page/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderModel/orderDropdown.dart';
import 'page/create_account_page/create_account_company.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CompanyCreateModel()),
        ChangeNotifierProvider(create: (context) => DropDownOrderModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ChatBot",
        routes: {
          '/': (context) => ButtonPage(),
          '/CompanyPage': (context) => CompanyHome(
                companyName: 'Company',
              ),
          '/loginHome': (context) => LoginHome(),
          '/jobPage': (context) => Job(),
          '/loginPersonal': (context) =>
              LoginPage(ImagePathEnums.CandidateLoginWallPaper.img, false),
          '/loginCompany': (context) =>
              LoginPage(ImagePathEnums.CompanyLoginWallPaper.img, true),
          '/createAccountPersonal': (context) => CreateAccountPersonal(),
          '/createAccountCompany': (context) => CreateAccountCompany(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => ErrorPage(
            errorMessage: "Page Not Found",
          ),
        ),
      ),
    );
  }
}
