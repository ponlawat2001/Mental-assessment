import 'package:flutter/material.dart';
import 'package:mentalassessment/views/assessment/assessment.dart';
import 'package:mentalassessment/views/assessment/assessment_description.dart';
import 'package:mentalassessment/views/assessment/assessment_detail.dart';
import 'package:mentalassessment/views/assessment/assessment_history.dart';
import 'package:mentalassessment/views/assessment/assessment_history_detail.dart';
import 'package:mentalassessment/views/assessment/assessment_main.dart';
import 'package:mentalassessment/views/assessment/assessment_other.dart';
import 'package:mentalassessment/views/contact/contact.dart';
import 'package:mentalassessment/views/navigator.dart';
import 'package:mentalassessment/views/news/news.dart';
import 'package:mentalassessment/views/news/news_detail.dart';
import 'package:mentalassessment/views/vent/vent.dart';
import 'package:mentalassessment/views/vent/ventinventory.dart';
import 'package:mentalassessment/views/vent/ventrecord.dart';
import 'package:mentalassessment/views/welcome.dart';

import '../views/login/forgetpassword.dart';
import '../views/login/forgetpassword_success.dart';
import '../views/home.dart';
import '../views/login/login.dart';
import '../views/login/register.dart';
import '../views/login/register_success.dart';

class RouteData {
  static Map<String, Widget Function(BuildContext)> routeData = {
    //Login & Register
    '/': (context) => const WelcomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/registersuccess': (context) => const RegisterSuccessScreen(),
    '/forget': (context) => const ForgetPasswordScreen(),
    '/forgetsuccess': (context) => const ForgetPasswordSuccessScreen(),
    '/newsdetail': (context) => const NewsDetailScreen(),
    '/vent': (context) => const VentScreen(),
    '/ventinventory': (context) => const VentInventoryScreen(),
    '/ventrecord': (context) => const VentRecordScreen(),
    '/assessment': (context) => const AssessmentScreen(),
    '/assessmentother': (context) => const AssessmentOtherScreen(),
    '/assessmentmain': (context) => const AssessmentMainScreen(),
    '/assessmentdetail': (context) => const AssessmentDetailScreen(),
    '/assessmenthistory': (context) => const AssessmentHistoryScreen(),
    '/assessmenthistorydetail': (context) =>
        const AssessmentHistoryDetailScreen(),
    '/assessmentdescription': (context) => const AssessmentDescriptionScreen(),
    '/contact': (context) => const ContactScreen(),

    //Navigator here
    '/navigator': (context) => const NavigatorScreen(),
    '/home': (context) => const HomeScreen(),
    '/news': (context) => const NewsScreen(),
  };
}
