import 'package:find_me/api/emoji_api/emoji_api.dart';
import 'package:find_me/models/emoji_model.dart';
import 'package:get/get.dart';

class EmojiMenuController extends GetxController {
  static EmojiMenuController get instance => Get.find();
  List<String> emojiWithValue = [
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
    "assets/images/smiling_face_with _halo.png",
  ];
  List<String> Emojis = [
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
    "assets/images/smiling_emoji.png",
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
  List<EmojiModel> paidEmojis = [];
  List<EmojiModel> freeEmojis = [];

  @override
  void onInit() {
    getEmojis();
    super.onInit();
  }

  getEmojis() async {
    var response = await EmojiApi.getEmojis();
    if (response.isNotEmpty) {
      allEmojis = [];
      paidEmojis = [];
      freeEmojis = [];
      allEmojis = List.from(response['emojis'])
          .map((emoji) => EmojiModel.fromJson(emoji as Map<String, dynamic>))
          .toList();
      paidEmojis =
          allEmojis.where((element) => element.type == "paid").toList();
      freeEmojis =
          allEmojis.where((element) => element.type == "free").toList();
      update();
    }

  }
}
