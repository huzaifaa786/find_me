import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController instance = Get.find();
  int navigationMenuIndex = 0;
  onChange(int value) {
    print("AAAAAAAAAAAAAAAAAAAAAA");
    navigationMenuIndex = value;
    update();
  }
}
