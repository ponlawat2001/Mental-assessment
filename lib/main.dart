import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/routes/routedata.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyCCkKwU9q0ezz-Y4FfbIudaBNw39_8UpK8',
              appId:
                  '48737335927-e5j6it49sjhnpndn82sa5otgibkmc5dv.apps.googleusercontent.com',
              messagingSenderId: '48737335927',
              projectId: 'mental-assessment'),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Assessment',
      theme: theme(),
      initialRoute: '/',
      routes: RouteData.routeData,
    );
  }
}
