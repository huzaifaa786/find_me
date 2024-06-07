import 'package:find_me/app/home/home_controller.dart';
import 'package:find_me/app/notifications/notifications_binding.dart';
import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NotificationsController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NotificationsController());
  }
}
