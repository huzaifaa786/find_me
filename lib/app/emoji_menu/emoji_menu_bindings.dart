import 'package:find_me/app/emoji_menu/emoji_menu_controller.dart';
import 'package:get/get.dart';

class EmojiMenuBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>EmojiMenuController());
  }
}
