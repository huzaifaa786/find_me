
import 'package:find_me/app/setting/setting_controller.dart';
import 'package:find_me/app/social_login/social_login_controller.dart';

import 'package:get/get.dart';

class SocialLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SocialLoginController());
  }
}