import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/helper.dart';
import 'package:mentalassessment/controllers/avatar_controller.dart';
import 'package:mentalassessment/controllers/profile_controller.dart';
import 'package:mentalassessment/model/user/user_model.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:mentalassessment/services/avatar_service.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';

import '../../constants/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AvatarService.fetchAvatar();
      profileController.setupProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  body(BuildContext context) {
    return GetX<AvatarController>(
      init: AvatarController(),
      builder: (controller) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imageBackground3_1),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(top: 36, right: 24),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    color: ColorTheme.white,
                    borderRadius: BorderRadius.circular(32)),
                child: PopupMenuButton(
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: ColorTheme.main5,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  iconSize: 16,
                  onSelected: (item) {
                    setState(() {
                      item;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      onTap: () {
                        AlertDialogselect.profileEditDialog(
                            context,
                            UserResult(
                                displayname: FirebaseAuth
                                        .instance.currentUser!.displayName ??
                                    'Unknown',
                                phone: Helper.phoneconverter(),
                                avatar: controller.avatar.value.avatar));
                      },
                      child: Text(
                        'Edit profile',
                        style: TextStyle(color: ColorTheme.main5),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        await AlertDialogselect.userDeleteDialog(context);
                      },
                      child: Text(
                        'Delete profile',
                        style: TextStyle(color: ColorTheme.validation),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetX<ProfileController>(
              init: ProfileController(),
              builder: (ProfileController controller) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 80, horizontal: 16),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(Assets.imageBackground3))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                FirebaseAuth
                                        .instance.currentUser!.displayName ??
                                    'Unknown',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.profile.value.email ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: ColorTheme.main5, fontSize: 16),
                              ),
                              controller.profile.value.phone == null
                                  ? const SizedBox()
                                  : const SizedBox(height: 8),
                              controller.profile.value.phone == ''
                                  ? const SizedBox()
                                  : Text(
                                      'เบอร์โทร: ${controller.profile.value.phone}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: ColorTheme.main5,
                                              fontSize: 16),
                                    ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 8),
                                child: Divider(
                                  color: ColorTheme.stroke,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Container(
                              //   width: 100,
                              //   height: 100,
                              //   color: Colors.amber,
                              // ),
                              // const SizedBox(height: 8),
                              // Text(
                              //   'ประเมินไปทั้งหมด: 7 ครั้ง',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .labelMedium!
                              //       .copyWith(
                              //           color: ColorTheme.main5, fontSize: 16),
                              // ),
                              // const SizedBox(height: 32),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    ),
                  ],
                );
              },
            ),
            Positioned(
              top: 140,
              child: Container(
                width: 120,
                height: 120,
                decoration: controller.renderAvatar() == ''
                    ? BoxDecoration(
                        color: ColorTheme.white,
                        image: const DecorationImage(
                            image: AssetImage(Assets.iconImage)),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: ColorTheme.lightGray2,
                            blurRadius: 8.0,
                          ),
                        ],
                      )
                    : BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(controller.renderAvatar())),
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
        );
      },
    );
  }
}
