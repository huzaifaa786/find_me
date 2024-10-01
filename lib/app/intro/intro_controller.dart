import 'package:find_me/services/notification_service.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  static IntroController instance = Get.find();
  bool showOpacity = false;

  @override
  void onInit() {
    Get.put(NotificationService());
    super.onInit();
  }

  void toggleOpacity() {
    showOpacity = !showOpacity;
    update();
  }
}
