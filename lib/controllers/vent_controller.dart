import 'package:get/get.dart';
import 'package:mentalassessment/model/vent/vent_%20model.dart';
import 'package:mentalassessment/model/vent/ventchoice_model.dart';
import '../model/vent/ventaudio_model.dart';

class VentController extends GetxController {
  Rx<VentModel>? ventlist = VentModel().obs;
  setVentlist(VentModel data) {
    ventlist?.value = data;
    update();
  }

  Rx<VentChoiceModel>? ventChoicelist = VentChoiceModel().obs;
  setVentChoicelist(VentChoiceModel data) {
    ventChoicelist?.value = data;
    update();
  }

  Rx<VentAudioModel>? ventAudiolist = VentAudioModel().obs;
  setVentAudiolist(VentAudioModel data) {
    ventAudiolist?.value = data;
    update();
  }
}
