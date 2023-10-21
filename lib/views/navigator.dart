import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/views/profile/profile.dart';

import '../constants/theme.dart';
import '../controllers/user_controller.dart';
import 'login/forgetpassword.dart';
import 'home.dart';
import 'login/register.dart';
import 'news.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    userController.fetchUsers();
  }

  int _selectedindex = 0;
  final List<Widget> _pageName = [
    const HomeScreen(),
    const ForgetPasswordScreen(),
    const RegisterScreen(),
    const NewsScreen(),
    const ProfileScreen(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pageName.elementAt(_selectedindex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        child: SizedBox(
          height: 110,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorTheme.white,
            unselectedItemColor: ColorTheme.main5,
            selectedItemColor: ColorTheme.main5,
            useLegacyColorScheme: false,
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w400, color: ColorTheme.main5),
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorTheme.main5),
            selectedFontSize: 12,
            unselectedFontSize: 8,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconHome),
                activeIcon: SvgPicture.asset(Assets.iconActiveHome),
                label: 'หน้าหลัก',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconVent),
                activeIcon: SvgPicture.asset(Assets.iconActiveVent),
                label: 'ระบาย',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconAssess),
                activeIcon: SvgPicture.asset(Assets.iconActiveAssess),
                label: 'ประเมิน',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconContact),
                activeIcon: SvgPicture.asset(Assets.iconActiveContact),
                label: 'ข่าวสาร',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconProfile),
                activeIcon: SvgPicture.asset(Assets.iconActiveProfile),
                label: 'โปรไฟล์',
              ),
            ],
            currentIndex: _selectedindex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
