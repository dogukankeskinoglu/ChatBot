import 'package:f_chatbot/Candidate/CandidateSignup/view/singupCandidate.dart';
import 'package:f_chatbot/Company/CompanyLogin/view/loginCompany.dart';
import 'package:f_chatbot/Company/CompanySignup/view/signupCompany.dart';
import 'package:f_chatbot/Job/Job.dart';
import 'package:f_chatbot/ProviderModel/companyCreateModel.dart';
import 'package:f_chatbot/ProviderModel/loginModel.dart';
import 'package:f_chatbot/page/company/Company_MVVM/View/CompanyHome.dart';
import 'package:f_chatbot/page/company/Company_MVVM/View/CompanyJobs.dart';
import 'package:f_chatbot/page/error_page/unknown_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Candidate/CandidateLogin/view/loginCandidate.dart';
import 'Company/CompanyInformation/view/companyInformation.dart';
import 'Home/home.dart';
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
        ChangeNotifierProvider(create: (context) => LoginModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ChatBot",
        routes: {
          '/': (context) => Home(),
          '/CompanyHome': (context) => CompanyHome(
                companyName: 'Company',
              ),
          '/CompanyInformation':(context)=>CompanyInformations(),
          '/CompanyJobs':(context)=>CompanyJobs(),
          //'/loginHome': (context) => LoginHome(),
          '/jobPage': (context) => Job(),
          '/loginPersonal': (context) =>LoginCandidate(),
          '/loginCompany': (context) =>LoginCompany(),
          '/createAccountPersonal': (context) => SignupCandidate(),
          '/createAccountCompany': (context) => SignupCompany(),
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
