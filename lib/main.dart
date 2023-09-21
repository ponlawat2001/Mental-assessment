import 'package:flutter/material.dart';
import 'package:mentalassessment/constant/theme.dart';
import 'package:mentalassessment/view/login.dart';

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
        home: const LoginScreen());
  }
}
