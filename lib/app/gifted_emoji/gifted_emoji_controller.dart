import 'package:find_me/api/emoji_api/emoji_api.dart';
import 'package:find_me/models/emoji_model.dart';
import 'package:get/get.dart';

class GiftedEmojiController extends GetxController {
  static GiftedEmojiController instance = Get.find();
  List<String> Emojis = [
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
  ];
  List<EmojiModel> allEmojis = [];

  @override
  void onInit() {
    super.onInit();
    giftedEmojis();
  }

  giftedEmojis() async {
    var response = await EmojiApi.getGiftedEmojis();
    if (response.isNotEmpty) {
      allEmojis = List.from(response['giftedEmojis'])
          .map((giftedEmoji) =>
              EmojiModel.fromJson(giftedEmoji as Map<String, dynamic>))
          .toList();

      update();
    }
  }
}
