import 'package:flutter/material.dart';
import 'package:mentalassessment/constant/assets.dart';
import 'package:mentalassessment/constant/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  SafeArea body(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorTheme.main30,
                      image: const DecorationImage(
                          image: AssetImage(Assets.imageWelcome))),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'ยินดีต้อนรับ',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'สำรวจตัวเอง ทุกวัน และรู้จักตัวเองให้มากขึ้น ไปพร้อมๆ กันใน Mental Assessment แอปพลิเคชันประเมินสภาวะทางจิต',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: ColorTheme.main5),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorTheme.maingrey,
                              borderRadius: BorderRadius.circular(8)),
                          child: buttonLogin(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buttonLogin(context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorTheme.main10,
                borderRadius: BorderRadius.circular(8)),
            child: Text('Sign in',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: ColorTheme.white)),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(8))),
            child: Text(
              'Register',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}
