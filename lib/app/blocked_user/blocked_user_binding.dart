import 'package:find_me/app/blocked_user/blocked_user_controller.dart';
import 'package:get/get.dart';

class BlockedUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlockedUserController());
  }
}
