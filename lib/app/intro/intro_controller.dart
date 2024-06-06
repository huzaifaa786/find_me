import 'package:get/get.dart';

class IntroController extends GetxController {
  static IntroController instance = Get.find();
  bool showOpacity = false;

  void toggleOpacity() {
    showOpacity = !showOpacity;
    update();
  }
}
