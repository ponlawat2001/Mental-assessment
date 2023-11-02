import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/model/avatar/avatar_model.dart';

class AvatarController extends GetxController {
  Rx<AvatarResult> avatar = AvatarResult().obs;

  setAvatars(AvatarResult res) async {
    avatar.value =
        AvatarResult(email: res.email, avatar: res.avatar, id: res.id);
    update();
  }

  String renderAvatar() {
    if (avatar.value.avatar == 'female01') return Assets.imageAvatarfemale01;
    if (avatar.value.avatar == 'female02') return Assets.imageAvatarfemale02;
    if (avatar.value.avatar == 'female03') return Assets.imageAvatarfemale03;
    if (avatar.value.avatar == 'female04') return Assets.imageAvatarfemale04;
    if (avatar.value.avatar == 'female05') return Assets.imageAvatarfemale05;
    if (avatar.value.avatar == 'female06') return Assets.imageAvatarfemale06;
    if (avatar.value.avatar == 'female07') return Assets.imageAvatarfemale07;
    if (avatar.value.avatar == 'female08') return Assets.imageAvatarfemale08;
    if (avatar.value.avatar == 'male01') return Assets.imageAvatarmale01;
    if (avatar.value.avatar == 'male02') return Assets.imageAvatarmale02;
    if (avatar.value.avatar == 'male03') return Assets.imageAvatarmale03;
    if (avatar.value.avatar == 'male04') return Assets.imageAvatarmale04;
    if (avatar.value.avatar == 'male05') return Assets.imageAvatarmale05;
    if (avatar.value.avatar == 'male06') return Assets.imageAvatarmale06;
    if (avatar.value.avatar == 'male07') return Assets.imageAvatarmale07;
    return '';
  }
}
