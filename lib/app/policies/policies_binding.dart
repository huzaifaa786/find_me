import 'package:find_me/app/policies/policies_controller.dart';
import 'package:find_me/app/edit_profile/edit_profile_controller.dart';
import 'package:get/get.dart';

class PoliciesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PoliciesController());
  }
}