import 'package:find_me/app/gifted_emoji/gifted_emoji_controller.dart';
import 'package:get/get.dart';

class GiftedEmojiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>GiftedEmojiController());
  }

}