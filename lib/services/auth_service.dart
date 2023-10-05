import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/model/login/login_post_model.dart';

import '../model/login/login_res_model.dart';

class AuthService {
  static signInWithGoogle(BuildContext context) async {
// Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      Navigator.pushReplacementNamed(context, '/navigator');
    }).catchError((e) => null);
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

  static signInWithEmail(PostEmailLogin? data) async {
    final dio = Dio();
    print(Serverinfo.login);
    Response response = await dio.post(
      Serverinfo.login,
      data: {
        'email': data?.email,
        'password': data?.password,
      },
    );
    ResEmailLogin result = ResEmailLogin(
        message: response.data['message'], result: response.data['result']);
    print(result.message);
  }
}
