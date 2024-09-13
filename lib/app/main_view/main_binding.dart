import 'package:find_me/app/coins/coins_store_controller.dart';
import 'package:find_me/app/edit_profile/edit_profile_controller.dart';
import 'package:find_me/app/emoji_store/emoji_store_controller.dart';
import 'package:find_me/app/home/home_controller.dart';
import 'package:find_me/app/main_view/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CoinsStoreController());
    Get.lazyPut(() => EmojiStoreController());
    Get.lazyPut(() => EditProfileController());
  }
}
