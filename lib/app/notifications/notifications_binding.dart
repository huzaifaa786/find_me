import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsController());
  }
}