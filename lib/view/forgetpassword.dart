import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../constant/assets.dart';
import '../constant/theme.dart';
import 'widget/widgetLayout/login_layout.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  LoginLayout body(BuildContext context) {
    return LoginLayout(
        child: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
      child: Stack(
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          Column(
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
              const SizedBox(height: 16),
              Text(
                'เจอกันอีกแล้ว วันนี้ก็มาพยายามทำวันนี้ให้เป็นวันที่ดีอีกวันกันเถอะ',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16, color: ColorTheme.main5),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  return EmailValidator.validate(value!)
                      ? 'อีเมลไม่ถูกต้อง'
                      : '';
                },
                style: Theme.of(context).inputDecorationTheme.labelStyle,
                cursorColor: ColorTheme.main5,
                decoration:
                    const InputDecoration(hintText: 'Enter your email..'),
              ),
              const SizedBox(height: 16),

              // ResetPassword Button
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/forgetsuccess'),
                child: Text(
                  'Continue',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorTheme.white),
                ),
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
