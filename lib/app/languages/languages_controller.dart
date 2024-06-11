import 'package:get/get.dart';

class LanguagesController extends GetxController {
  static LanguagesController get instance => Get.find();

  int selectedLanguage = 0;

  void changeLanguage(int index) {
    selectedLanguage = index;
    update(); // Notify listeners to rebuild the UI
  }
}
