import 'package:find_me/app/notifications_permissions/notifications_permissions_controller.dart';
import 'package:get/get.dart';

class NotificationsPermissionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsPermissionsController());
  }
}
