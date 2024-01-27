import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/services/avatar_service.dart';
import 'package:mentalassessment/views/widgets/newslist_widget.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';
import '../controllers/avatar_controller.dart';
import '../services/news_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NewsService.fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  RefreshIndicator body(BuildContext context) {
    return RefreshIndicator(
      color: ColorTheme.main10,
      onRefresh: () {
        return NewsService.fetchNews();
      },
      child: Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetX<AvatarController>(
                          init: AvatarController(),
                          builder: (controller) {
                            return controller.renderAvatar() == ''
                                ? Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: ColorTheme.white,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: SvgPicture.asset(
                                      Assets.iconPerson,
                                      width: 24,
                                      height: 24,
                                      colorFilter: ColorFilter.mode(
                                          ColorTheme.main5, BlendMode.srcIn),
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Image.asset(
                                      controller.renderAvatar(),
                                      width: 52,
                                      height: 52,
                                    ),
                                  );
                          }),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: ColorTheme.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'ปรึกษากับเรา',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'สวัสดี ${FirebaseAuth.instance.currentUser?.displayName?.split(' ').first ?? ''}',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'เริ่มทำการประเมินกัน \nมีแบบประเมินหลายแบบให้เลือกเลย',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: ColorTheme.worseEmoji,
                        minimumSize: const Size(200, 50),
                        maximumSize: const Size.fromWidth(210),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16)),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/assessmentmain');
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.iconHeart),
                        const SizedBox(width: 8),
                        Text(
                          'เริ่มทำแบบประเมินรวม',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ColorTheme.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          color: ColorTheme.stroke,
                        )),
                      ],
                    ),
                  ),
                  Text(
                    'ข่าวสารและบทความ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: const SizedBox(
                      height: 250,
                      child: NewlistWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buttonNav(
      BuildContext context, String icon, String title, String path) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, path),
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: ColorTheme.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
