import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/app/updata_phone_number%5D/updata_phone_number_controller.dart';
import 'package:get/get.dart';

class UpdataPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdataPhoneNumberController());
  }
}
