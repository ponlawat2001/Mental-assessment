import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/routes/routedata.dart';

main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
