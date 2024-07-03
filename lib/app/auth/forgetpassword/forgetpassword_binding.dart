import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>ForgetPasswordController());
  }
}