import 'package:find_me/api/emoji_api/emoji_api.dart';
import 'package:find_me/models/emoji_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyEmojisController extends GetxController {
  static MyEmojisController instance = Get.find();
  List<EmojiModel> allEmojis = [];
  final data = [1, 2, 3, 4, 5];
  Color deleteColor = Colors.redAccent.withOpacity(0.5);

  @override
  void onInit() {
    super.onInit();
    myemojis();
  }

  myemojis() async {
    var response = await EmojiApi.myEmojis();
    if (response.isNotEmpty) {
      GetStorage box = GetStorage();
      box.read("api_token");
      print(box.read("api_token"));
      allEmojis = List.from(response['myEmojis'])
          .map((myEmojis) =>
              EmojiModel.fromJson(myEmojis as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  updateEmojiOrder({isDelete = false}) async {
    List<int?> emojiOrder = allEmojis.map((emoji) => emoji.id).toList();
    var response = await EmojiApi.updateEmojiOrder(emojiOrder);

    if (response.isNotEmpty && isDelete == false) {
      UiUtilites.successSnackbar(response['message'].toString().tr, "");
    }
  }

  deleteEmoji(int emojiId) async {
    var response = await EmojiApi.deleteEmoji(emojiId);
    if (response.isNotEmpty) {
      allEmojis.removeWhere((emoji) => emoji.id == emojiId);
      updateEmojiOrder(isDelete: true);
      UiUtilites.successSnackbar("Emoji removed successfully".tr, "");
      update();
    } else {
      UiUtilites.errorSnackbar("Failed to delete emoji", response['message']);
    }
  }
}
