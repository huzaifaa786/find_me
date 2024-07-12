import 'package:find_me/app/auth/new_password/new_password_controller.dart';
import 'package:get/get.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPasswordController());
  }
}
