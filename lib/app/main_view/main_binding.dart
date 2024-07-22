import 'package:find_me/app/account/profile/profile_controller.dart';
import 'package:find_me/app/auth/signup/signup_controller.dart';
import 'package:find_me/app/coins/coins_store_controller.dart';
import 'package:find_me/app/edit_profile/edit_profile_controller.dart';
import 'package:find_me/app/emoji_store/emoji_store_controller.dart';
import 'package:find_me/app/home/home_controller.dart';
import 'package:find_me/app/notifications/notifications_binding.dart';
import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:find_me/app/report/report_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CoinsStoreController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EmojiStoreController());
    Get.lazyPut(() => EditProfileController());
  }
}
