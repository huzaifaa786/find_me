import 'package:find_me/api/emoji_api/emoji_api.dart';
import 'package:find_me/models/emoji_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EmojiMenuController extends GetxController {
  static EmojiMenuController get instance => Get.find();
  List<EmojiModel> allEmojis = [];
  List<EmojiModel> paidEmojis = [];
  List<EmojiModel> freeEmojis = [];
  String? id;
  String? apitoken;

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

  addEmojis(id) async {
    GetStorage box = GetStorage();
    box.read("api_token");

    var response = await EmojiApi.addEmojis(
      id: id,
    );
    print( box.read("api_token"));
    if (response.isNotEmpty) {
      UiUtilites.successSnackbar("Emoji added successfully".tr, "");
      Get.back();
    }
  }
}
