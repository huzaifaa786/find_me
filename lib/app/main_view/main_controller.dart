import 'package:find_me/app/home/home_controller.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController instance = Get.find();
  static HomeController homeController = Get.find();
  int navigationMenuIndex = 0;

  onChange(int value, {isScan = false}) async {

    navigationMenuIndex = value;
    update();
    if (isScan) {
      if (!homeController.isSearching) {
        await homeController.checkData();
        update();
      }
    }
  }
}
