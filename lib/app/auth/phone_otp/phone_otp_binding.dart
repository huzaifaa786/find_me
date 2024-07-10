import 'package:find_me/app/auth/phone_otp/phone_otp_controller.dart';
import 'package:get/get.dart';

class PhoneOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneOtpController());
  }
}
