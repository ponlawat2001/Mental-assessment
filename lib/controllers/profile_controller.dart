import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/model/user/user_model.dart';

import '../constants/helper.dart';

class ProfileController extends GetxController {
  Rx<UserResult> profile = UserResult().obs;

  setupProfile() {
    profile.value.phone = Helper.phoneconverter();
    profile.value.email = FirebaseAuth.instance.currentUser!.email;
    profile.value.displayname = FirebaseAuth.instance.currentUser!.displayName;
    update();
  }
}
