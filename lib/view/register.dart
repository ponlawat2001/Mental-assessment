import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mentalassessment/view/component/component.dart';
import 'package:mentalassessment/view/widgetLayout/homeLayout.dart';

import '../constant/assets.dart';
import '../constant/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(context),
    );
  }

  HomeLayout body(BuildContext context) {
    return HomeLayout(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.iconLogo,
              semanticLabel: 'Mental Assessment',
              width: 100,
              height: 100,
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
            const SizedBox(height: 8),
            TextFormField(
              validator: (value) {
                return EmailValidator.validate(value!) ? 'อีเมลไม่ถูกต้อง' : '';
              },
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              cursorColor: ColorTheme.main5,
              decoration: const InputDecoration(hintText: 'Enter your email..'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              style: Theme.of(context).inputDecorationTheme.labelStyle,
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
              cursorColor: ColorTheme.main5,
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                  hintText: 'Confirm your password..',
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

            //Sign up Button
            ElevatedButton(
              onPressed: () {},
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
              onPressed: () {},
              child: Component.socialTextButton(
                  context, Assets.iconGoogleLogo, 'Continue with Google'),
            ),
            const SizedBox(height: 16),

            //Signin with Facebook Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: ColorTheme.main10,
                backgroundColor: ColorTheme.white,
              ),
              onPressed: () {},
              child: Component.socialTextButton(
                  context, Assets.iconFacebookLogo, 'Continue with Facebook'),
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
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Sign in',
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
    ));
  }
}
