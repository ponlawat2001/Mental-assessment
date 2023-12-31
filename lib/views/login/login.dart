import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/formvalidate.dart';
import 'package:mentalassessment/model/login/login_post_model.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:mentalassessment/views/components/component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/assets.dart';
import '../../constants/theme.dart';
import '../widgets/widgetLayout/layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  UserCredential? googlesignin;
  bool _passwordVisible = true;
  bool _rememberMe = false;

  @override
  initState() {
    super.initState();
    callRemember();
  }

  Future<void> callRemember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? temp = prefs.getStringList('remember');
    _rememberMe = prefs.getBool('isCheckremember') ?? false;
    if (temp != null) {
      emailField.text = temp[0];
      passwordField.text = temp[1];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Layout(
      backgroundAsset: Assets.imageBackground,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    Assets.iconLogo,
                    semanticLabel: 'Mental Assessment',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'สวัสดี',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 36),
                ),
                const SizedBox(height: 8),
                Text(
                  'เจอกันอีกแล้ว วันนี้ก็มาพยายามทำวันนี้ให้เป็นวันที่ดีอีกวันกันเถอะ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16, color: ColorTheme.main5),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailField,
                  onChanged: (value) {
                    emailField.text = value;
                  },
                  validator: (value) {
                    if (Formvalidate.notemptyForm(value ?? '') != '') {
                      return Formvalidate.notemptyForm(value ?? '');
                    } else if (Formvalidate.emailvalidateForm(value ?? '') !=
                        '') {
                      return Formvalidate.emailvalidateForm(value ?? '');
                    }

                    return null;
                  },
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  cursorColor: ColorTheme.main5,
                  decoration:
                      const InputDecoration(hintText: 'Enter your email..'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: passwordField,
                  onChanged: (value) {
                    passwordField.text = value;
                  },
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                  validator: (value) {
                    if (Formvalidate.notemptyForm(value ?? '') != '') {
                      return Formvalidate.notemptyForm(value ?? '');
                    }
                    return null;
                  },
                  cursorColor: ColorTheme.main5,
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                      hintText: 'Enter your password..',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility))),
                ),
                //  Remember Me
                rememberMe(context),

                // Sign in Button
                ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (formKey.currentState!.validate()) {
                      PostEmailLogin? temp = PostEmailLogin(
                        email: emailField.text,
                        password: passwordField.text,
                      );
                      if (_rememberMe) {
                        prefs.setBool('isCheckremember', true);
                        prefs.setStringList('remember',
                            <String>[emailField.text, passwordField.text]);
                      } else if (prefs.getStringList('remember') != null) {
                        prefs.remove('remember');
                        prefs.remove('isCheckremember');
                      }
                      if (!context.mounted) return;
                      AuthService.signInWithEmail(temp, context);
                    }
                  },
                  child: Text(
                    'Sign in',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ColorTheme.white),
                  ),
                ),

                // Divider --Or--
                Component.dividerOr(context),
                //Signin with Google Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ColorTheme.main10,
                    backgroundColor: ColorTheme.white,
                  ),
                  onPressed: () async {
                    AuthService.signInWithGoogle(context);
                  },
                  child: Component.socialTextButton(
                      context, Assets.iconGoogleLogo, 'Continue with Google'),
                ),
                const SizedBox(height: 8),

                //Signin with Facebook Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ColorTheme.main10,
                    backgroundColor: ColorTheme.white,
                  ),
                  onPressed: () async {
                    AuthService.signInWithFacebook(context);
                  },
                  child: Component.socialTextButton(context,
                      Assets.iconFacebookLogo, 'Continue with Facebook'),
                ),
                const SizedBox(height: 16),

                // Register Sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Row rememberMe(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
            Text(
              'Remember Me',
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/forget'),
          child: Text(
            'Forget password?',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
