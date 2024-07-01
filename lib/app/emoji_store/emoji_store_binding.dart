import 'package:find_me/app/emoji_store/emoji_store_controller.dart';
import 'package:get/get.dart';

class EmojiStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmojiStoreController());
  }
}
