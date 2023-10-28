import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/model/avatar_model.dart';
import 'package:mentalassessment/services/avatar_service.dart';

class AvatarController extends GetxController {
  Rx<AvatarResult> users = AvatarResult().obs;

  fetchUsers() async {
    AvatarResult res = await AvatarService.avatarUser(
        FirebaseAuth.instance.currentUser?.email ?? ':email');
    users.value =
        AvatarResult(email: res.email, avatar: res.avatar, id: res.id);
    update();
  }
}
