import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentalassessment/constant/theme.dart';
import 'package:mentalassessment/route/routedata.dart';
import 'firebase_options.dart';

main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
