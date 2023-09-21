import 'package:flutter/material.dart';
import 'package:mentalassessment/constant/assets.dart';
import './widgetLayout/homeLayout.dart';
import '../constant/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeLayout(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: ColorTheme.main30,
                  image: const DecorationImage(
                      image: AssetImage(Assets.iconLogo))),
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
              cursorColor: ColorTheme.main5,
              decoration: const InputDecoration(hintText: 'Enter your email..'),
            ),
            const SizedBox(height: 8),
            TextFormField(
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
            // Radio(
            //   value: (value) => {value = !value},
            //   groupValue: 'remember',
            //   onChanged: () =>
            //     value = vaule;,
            // )
          ],
        ),
      )),
    ));
  }
}
