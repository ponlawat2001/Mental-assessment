import 'package:flutter/material.dart';
import 'package:mentalassessment/constant/assets.dart';
import './widgetLayout/homeLayout.dart';
import '../constant/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            Text(
              'สวัสดี',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 36),
            ),
            Text(
              'เจอกันอีกแล้ว วันนี้ก็มาพยายามไปด้วยกัน เถอะนะ',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 16, color: ColorTheme.main5),
            ),
          ],
        ),
      )),
    ));
  }
}
