import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constant/assets.dart';

import '../../constant/theme.dart';
import '../widget/widgetLayout/layout.dart';

class RegisterSuccessScreen extends StatefulWidget {
  const RegisterSuccessScreen({super.key});

  @override
  State<RegisterSuccessScreen> createState() => _RegisterSuccessScreenState();
}

class _RegisterSuccessScreenState extends State<RegisterSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    return Layout(
        backgroundAsset: Assets.imageBackground,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.iconSuccess,
                width: 48,
                height: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'สร้างบัญชีสำเร็จ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'คุณสามารถใช้อีเมลใหม่สำหรับ\nเข้าสู่ระบบบัญชีของคุณ',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16, color: ColorTheme.main5),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text(
                  'Sign in',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorTheme.white),
                ),
              ),
            ],
          ),
        )));
  }
}
