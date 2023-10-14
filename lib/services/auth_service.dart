import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/model/login/login_post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login/login_res_model.dart';
import '../views/widgets/alert_dialog.dart';

class AuthService {
  static signInWithGoogle(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      if (!context.mounted) return;
      AlertDialogselect.loadingDialog(context);
      await FirebaseAuth.instance.signInWithCredential(credential);
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken();
      prefs.setString('token', token ?? '');
      log(prefs.getString('token') ?? '');
      if (!context.mounted) return;
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/navigator');
    } catch (e) {
      return null;
    }
  }

  static signInWithFacebook(BuildContext context) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((user) {
      Navigator.pushReplacementNamed(context, '/navigator');
    }).catchError((e) => null);
  }

  static signInWithEmail(PostEmailLogin? data, context) async {
    AlertDialogselect.loadingDialog(context);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final dio = Dio();

    Response response = await dio.post(
      //for dev
      (Platform.isAndroid) ? Serverinfo.loginAndroid : Serverinfo.login,
      data: {
        'email': data?.email,
        'password': data?.password,
      },
    );
    ResEmailLogin result = ResEmailLogin(
        message: response.data['message'], result: response.data['result']);
    if (result.result == '') {
      await AlertDialogselect.alertworngpass(context);
      Navigator.pop(context);
    } else {
      prefs.setString('token', result.result!);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/navigator');
    }
  }

  static Future<bool> signInCheck(context) async {
    bool isSignIn = false;
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        isSignIn = false;
      } else {
        isSignIn = true;
        Navigator.pushReplacementNamed(context, '/navigator');
      }
    });
    await Future.delayed(const Duration(milliseconds: 1));
    return isSignIn;
  }

  static signOut(context) async {
    AlertDialogselect.alertlogout(context);
  }
}
