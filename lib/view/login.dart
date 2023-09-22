import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mentalassessment/view/component/component.dart';
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
  bool _rememberMe = false;

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
            Component.dividerOr(context),
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
            const SizedBox(height: 8),

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
      )),
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
