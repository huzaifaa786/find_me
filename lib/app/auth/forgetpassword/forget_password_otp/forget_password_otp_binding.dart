import 'package:find_me/app/auth/forgetpassword/forget_password_otp/forget_password_otp_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ForgetPasswordOtpController());
  }
}
