import 'package:get/get.dart';

class SubscriptionsController extends GetxController {
  static SubscriptionsController intance = Get.find();
    int selectedOption = 0;


   void selectOption(int value) {
    selectedOption = value;
    update();
  }
}

