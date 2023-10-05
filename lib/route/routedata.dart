import 'package:flutter/material.dart';
import 'package:mentalassessment/view/navigator.dart';
import 'package:mentalassessment/view/news.dart';
import 'package:mentalassessment/view/welcome.dart';

import '../view/login/forgetpassword.dart';
import '../view/login/forgetpassword_success.dart';
import '../view/login/home.dart';
import '../view/login/login.dart';
import '../view/login/register.dart';
import '../view/login/register_success.dart';

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
