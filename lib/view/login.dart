import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant/assets.dart';
import './widgetLayout/homeLayout.dart';
import '../constant/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = true;
  bool _rememberMe = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(context),
    );
  }

  body(BuildContext context) {
    return HomeLayout(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.iconLogo,
              semanticLabel: 'Mental Assessment',
              width: 100,
              height: 100,
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
            //  Remember Me
            rememberMe(context),

            // Sign in Button
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sign in',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorTheme.white),
              ),
            ),

            // Divider --Or--
            dividerOr(context),

            //Signin with Google Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: ColorTheme.main10,
                backgroundColor: ColorTheme.white,
              ),
              onPressed: () {},
              child: socialTextButton(
                  context, Assets.iconGoogleLogo, 'Continue with Google'),
            ),
            const SizedBox(height: 8),

            //Signin with Facebook Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: ColorTheme.main10,
                backgroundColor: ColorTheme.white,
              ),
              onPressed: () {},
              child: socialTextButton(
                  context, Assets.iconFacebookLogo, 'Continue with Facebook'),
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
                Text(
                  'Sign up',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Row socialTextButton(BuildContext context, String assetName, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetName,
          semanticsLabel: 'Google Logo',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorTheme.main5),
        ),
      ],
    );
  }

  Row dividerOr(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: ColorTheme.main5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'or',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorTheme.main5,
          ),
        ),
      ],
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
                }),
            Text(
              'Remember Me',
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
        InkWell(
          onTap: () {},
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
