import 'package:find_me/app/auth/changepassword/changepassword_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePaswordController());
  }
}