import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/model/login/login_post_model.dart';
import 'package:mentalassessment/model/register/register_post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login/login_res_model.dart';
import '../views/widgets/alert_dialog.dart';

class AuthService {
  static sendResetpassword(String email, context) async {
    AlertDialogselect.loadingDialog(context);
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((_) {
      Navigator.pushReplacementNamed(context, '/forgetsuccess');
    }).catchError(
      (e) async {
        await AlertDialogselect.alertcation(
            context, 'ไม่พบอีเมลนี้ในระบบ', 'กรุณาตรวจสอบใหม่อีกครั้ง');
        Navigator.pop(context);
      },
    );
  }

  static fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final newtoken = await FirebaseAuth.instance.currentUser?.getIdToken();
    newtoken != null ? await prefs.setString('token', newtoken) : {};
    print('fetchNewtoken: ${prefs.get('token')}');
  }

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

  static signInWithEmail(PostEmailLogin data, context) async {
    AlertDialogselect.loadingDialog(context);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final dio = Dio();

    Response response = await dio.post(
      //for dev
      (Platform.isAndroid) ? Serverinfo.loginAndroid : Serverinfo.login,
      data: {
        'email': data.email,
        'password': data.password,
      },
    );
    //signin email

    //signin api
    ResEmailLogin result = ResEmailLogin(
        message: response.data['message'], result: response.data['result']);
    if (result.result == '') {
      await AlertDialogselect.alertcation(
          context, 'อีเมลหรือรหัสผ่านไม่ถูกต้อง', 'กรุณาตรวจสอบใหม่อีกครั้ง');
      Navigator.pop(context);
    } else {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data.email, password: data.password);
      prefs.setString('token', result.result!);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/navigator');
    }
  }

  static Future<bool> signInCheck(context) async {
    bool isSignIn = false;
    (FirebaseAuth.instance.currentUser == null)
        ? isSignIn = false
        : {
            isSignIn = true,
            Navigator.pushReplacementNamed(context, '/navigator')
          };
    // FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    //   if (user == null) {
    //     isSignIn = false;
    //   } else {
    //     isSignIn = true;
    //     Navigator.pushReplacementNamed(context, '/navigator');
    //   }
    // });
    // await Future.delayed(const Duration(milliseconds: 1));
    return isSignIn;
  }

  static signOut(context) async {
    AlertDialogselect.alertlogout(context);
  }

  static register(BuildContext context, RegisterModel data) async {
    final dio = Dio();
    AlertDialogselect.loadingDialog(context);
    Response response = await dio.post(
      //for dev
      (Platform.isAndroid)
          ? Serverinfo.registeAndroid
          : Serverinfo.registeAndroid,
      data: {
        'email': data.email,
        'password': data.password,
      },
    );
    if (!context.mounted) return;
    Navigator.pop(context);

    if (response.data['message'] == 'auth/email-already-in-use') {
      if (!context.mounted) return;
      AlertDialogselect.alertcation(
          context, 'บัญชีนี้ถูกใช้แล้ว', 'กรุณาลองใหม่อีกครั้ง');
    } else {
      signInWithEmail(
          PostEmailLogin(email: data.email, password: data.password), context);
    }
  }
}
