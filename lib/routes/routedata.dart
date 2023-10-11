import 'package:flutter/material.dart';
import 'package:mentalassessment/views/navigator.dart';
import 'package:mentalassessment/views/news.dart';
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

    //Navigator here
    '/navigator': (context) => const NavigatorScreen(),
    '/home': (context) => const HomeScreen(),
    '/news': (context) => const NewsScreen(),
  };
}
