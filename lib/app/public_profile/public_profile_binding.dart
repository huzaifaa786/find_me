import 'package:find_me/app/public_profile/public_profile_controller.dart';
import 'package:get/get.dart';

class PublicProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublicProfileController());
  }
}
