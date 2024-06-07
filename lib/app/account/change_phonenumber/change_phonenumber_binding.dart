import 'package:find_me/app/account/change_phonenumber/change_phonenumber_controller.dart';
import 'package:find_me/app/account/profile/account_controller.dart';
import 'package:get/get.dart';

class ChangePhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePhoneNumberController());
  }
}
