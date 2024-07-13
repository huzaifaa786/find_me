import 'package:find_me/app/create_business_card/create_card_controller.dart';
import 'package:find_me/app/edit_account/edit_account_information_controller.dart';
import 'package:find_me/app/edit_profile/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditAccountInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditAccountInformationController());
  }
}