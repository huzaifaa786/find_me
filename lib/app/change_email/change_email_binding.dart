import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/app/change_email/change_email_controller.dart';
import 'package:get/get.dart';

class ChangeEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeEmailController());
  }
}