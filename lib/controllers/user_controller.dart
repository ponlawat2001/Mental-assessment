import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/model/userinfomation_model.dart';
import 'package:mentalassessment/services/user_service.dart';

class UserController extends GetxController {
  Rx<UserInformation> users = UserInformation().obs;

  fetchUsers() async {
    UserInformation res = await UserService.avatarUser(
        FirebaseAuth.instance.currentUser?.email ?? ':email');
    users.value = UserInformation(email: res.email, avatar: res.avatar);
    update();
  }
}
