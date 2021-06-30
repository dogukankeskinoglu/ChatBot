import 'package:f_chatbot/Candidate/CandidateChat/view/candidateChat.dart';
import 'package:f_chatbot/Candidate/CandidateJob/view/candidateJob.dart';
import 'package:f_chatbot/Candidate/CandidateSignup/view/singupCandidate.dart';
import 'package:f_chatbot/Company/CompanyHome/companyHome.dart';
import 'package:f_chatbot/Company/CompanyJob/ListJob/view/CompanyJobState.dart';
import 'package:f_chatbot/Company/CompanyLogin/view/loginCompany.dart';
import 'package:f_chatbot/Company/CompanySignup/view/signupCompany.dart';
import 'package:f_chatbot/ProviderModel/companyCreateModel.dart';
import 'package:f_chatbot/ProviderModel/loginModel.dart';
import 'package:f_chatbot/page/error_page/unknown_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Candidate/CandidateLogin/view/loginCandidate.dart';
import 'Company/CompanyInformation/view/companyInformation.dart';
import 'Company/CompanyJob/CreateJob/view/CompanyCreateJob.dart';
import 'Home/home.dart';
import 'ProviderModel/orderDropdown.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          '/CandidateChat': (context) => CandidateChat(),
          '/CompanyInformation': (context) => CompanyInformations(),
          '/CompanyJobs': (context) => CompanyJobState(),
          '/CreateJob': (context) => CompanyCreateJob(),
          //'/loginHome': (context) => LoginHome(),
          '/jobPage': (context) => CandidateJob(),
          '/loginPersonal': (context) => LoginCandidate(),
          '/loginCompany': (context) => LoginCompany(),
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
