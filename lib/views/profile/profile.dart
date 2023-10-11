import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/services/auth_service.dart';

import '../../constants/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imageBackground3_1),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.imageBackground3))),
                  child: Column(
                    children: [
                      Text(
                        'ดร.พลวัต ฉัตรแก้ว',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'ponlawat.chatkaew@gmail.com',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: ColorTheme.main5, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'เบอร์โทร: 091234567',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: ColorTheme.main5, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: Divider(
                          color: ColorTheme.stroke,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.amber,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'สภาพจิตใจในอาทิตย์นี้',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'ประเมินไปทั้งหมด: 7 ครั้ง',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: ColorTheme.main5, fontSize: 16),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorTheme.validation,
                              textStyle: TextStyle(
                                  fontFamily: 'Prompt',
                                  color: ColorTheme.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                            ),
                            onPressed: () {
                              AuthService.signOut(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                ),
                                SizedBox(width: 8),
                                Text('Sign out'),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 140,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: ColorTheme.lightGray2,
                    blurRadius: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
