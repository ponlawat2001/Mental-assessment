import 'package:flutter/material.dart';
import 'package:mentalassessment/view/forgetpassword.dart';
import 'package:mentalassessment/view/forgetpassword_success.dart';
import 'package:mentalassessment/view/home.dart';
import 'package:mentalassessment/view/login.dart';
import 'package:mentalassessment/view/navigator.dart';
import 'package:mentalassessment/view/news.dart';
import 'package:mentalassessment/view/register.dart';
import 'package:mentalassessment/view/register_success.dart';
import 'package:mentalassessment/view/welcome.dart';

class RouteData {
  static Map<String, Widget Function(BuildContext)> routeData = {
    //Login & Register
    '/': (context) => const WelcomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/registersuccess': (context) => const RegisterSuccessScreen(),
    '/forget': (context) => const ForgetPasswordScreen(),
    '/forgetsuccess': (context) => const ForgetPasswordSuccessScreen(),

    //Navigator here
    '/navigator': (context) => const NavigatorScreen(),
    '/home': (context) => const HomeScreen(),
    '/news': (context) => const NewsScreen(),
  };
}
