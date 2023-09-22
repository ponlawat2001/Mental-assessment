import 'package:flutter/material.dart';
import 'package:mentalassessment/constant/theme.dart';
import 'package:mentalassessment/route/routedata.dart';
import 'package:mentalassessment/view/forgetpassword.dart';
import 'package:mentalassessment/view/forgetpasswordSuccess.dart';
import 'package:mentalassessment/view/login.dart';
import 'package:mentalassessment/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Assessment',
      theme: theme(),
      initialRoute: '/',
      routes: RouteData.routeData,
    );
  }
}
