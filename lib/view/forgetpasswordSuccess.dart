import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constant/assets.dart';
import 'package:mentalassessment/view/widgetLayout/homeLayout.dart';

import '../constant/theme.dart';

class ForgetPasswordSuccessScreen extends StatefulWidget {
  const ForgetPasswordSuccessScreen({super.key});

  @override
  State<ForgetPasswordSuccessScreen> createState() =>
      _ForgetPasswordSuccessScreenState();
}

class _ForgetPasswordSuccessScreenState
    extends State<ForgetPasswordSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeLayout(
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
              'ส่งอีเมลรีเซ็ทรหัสผ่านสำเร็จ',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'คุณสามารถใช้รหัสผ่านใหม่สำหรับ \nเข้าสู่ระบบบัญชีของคุณ',
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
      ))),
    );
  }
}
