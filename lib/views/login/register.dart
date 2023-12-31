import 'package:flutter/material.dart';
import 'package:mentalassessment/model/register/register_post_model.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:mentalassessment/views/components/component.dart';

import '../../constants/assets.dart';
import '../../constants/formvalidate.dart';
import '../../constants/theme.dart';
import '../widgets/widgetLayout/layout.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailField = TextEditingController();
  final _passwordField = TextEditingController();
  final _passwordconfirmField = TextEditingController();
  bool _passwordVisible = true;
  bool _passwordconfirmVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    String temppassword = '';

    return Layout(
        backgroundAsset: Assets.imageBackground,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      'สร้างบัญชีใหม่',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 36),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'มารู้จักตัวเองให้มากยิ่งขึ้นไปพร้อมกับเรา',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16, color: ColorTheme.main5),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailField,
                      onChanged: (value) {
                        _emailField.text = value;
                      },
                      validator: (value) {
                        if (Formvalidate.notemptyForm(value ?? '') != '') {
                          return Formvalidate.notemptyForm(value ?? '');
                        } else if (Formvalidate.emailvalidateForm(
                                value ?? '') !=
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
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      controller: _passwordField,
                      onChanged: (value) {
                        _passwordField.text = value;
                      },
                      validator: (value) {
                        temppassword = _passwordField.text;
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
                    const SizedBox(height: 8),
                    TextFormField(
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      controller: _passwordconfirmField,
                      onChanged: (value) {
                        _passwordconfirmField.text = value;
                      },
                      validator: (value) {
                        if (Formvalidate.notemptyForm(value ?? '') != '') {
                          return Formvalidate.notemptyForm(value ?? '');
                        } else if (temppassword != value) {
                          return 'รหัสผ่านไม่ตรงกัน';
                        }
                        return null;
                      },
                      cursorColor: ColorTheme.main5,
                      obscureText: _passwordconfirmVisible,
                      decoration: InputDecoration(
                          hintText: 'Confirm your password..',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordconfirmVisible =
                                      !_passwordconfirmVisible;
                                });
                              },
                              icon: Icon(_passwordconfirmVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility))),
                    ),
                    const SizedBox(height: 16),

                    //Sign up Button
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          RegisterModel data = RegisterModel(
                              email: _emailField.text,
                              password: _passwordField.text,
                              avatar: 'avatarfemale01');
                          await AuthService.register(context, data);
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ColorTheme.white),
                      ),
                    ),
                    Component.dividerOr(context),
                    const SizedBox(height: 8),

                    //Signin with Google Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: ColorTheme.main10,
                        backgroundColor: ColorTheme.white,
                      ),
                      onPressed: () {
                        AuthService.signInWithGoogle(context);
                      },
                      child: Component.socialTextButton(context,
                          Assets.iconGoogleLogo, 'Continue with Google'),
                    ),
                    const SizedBox(height: 16),

                    //Signin with Facebook Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: ColorTheme.main10,
                        backgroundColor: ColorTheme.white,
                      ),
                      onPressed: () {},
                      child: Component.socialTextButton(context,
                          Assets.iconFacebookLogo, 'Continue with Facebook'),
                    ),
                    const SizedBox(height: 16),

                    // Login Sign in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You have an account?",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: Text(
                            'Sign in',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
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
            ),
          ),
        ));
  }
}
