import 'package:flutter/material.dart';
import 'package:mentalassessment/constant/assets.dart';
import 'package:mentalassessment/constant/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          image: AssetImage(assets.imageWelcome))),
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
                            style: Theme.of(context).textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'สำรวจตัวเอง ทุกวัน และรู้จักตัวเองให้มากขึ้น ไปพร้อมๆ กันใน Mental Assessment แอปพลิเคชันประเมินสภาวะทางจิต',
                            style: Theme.of(context).textTheme.labelSmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(),
                          onPressed: () {},
                          child: const Text('Sign in'))
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
}
