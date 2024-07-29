import 'package:find_me/api/emoji_api/emoji_api.dart';
import 'package:find_me/models/emoji_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyEmojisController extends GetxController {
  static MyEmojisController instance = Get.find();
  List<EmojiModel> allEmojis = [];


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
          .map((myEmojis) => EmojiModel.fromJson(myEmojis as Map<String, dynamic>))
          .toList();
         

      update();
    }
  }
}
