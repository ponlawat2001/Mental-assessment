import 'package:flutter/material.dart';
import 'package:mentalassessment/view/forgetpassword.dart';
import 'package:mentalassessment/view/forgetpasswordSuccess.dart';
import 'package:mentalassessment/view/login.dart';
import 'package:mentalassessment/view/register.dart';
import 'package:mentalassessment/view/registerSuccess.dart';
import 'package:mentalassessment/view/welcome.dart';

class RouteData {
  static Map<String, Widget Function(BuildContext)> routeData = {
    '/': (context) => const WelcomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/registersuccess': (context) => const RegisterSuccessScreen(),
    '/forget': (context) => const ForgetPasswordScreen(),
    '/forgetsuccess': (context) => const ForgetPasswordSuccessScreen(),
  };
}
