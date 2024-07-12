import 'package:find_me/app/auth/email_otp/email_otp_controller.dart';
import 'package:get/get.dart';

class EmailOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailOtpController());
  }
}
