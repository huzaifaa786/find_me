import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class EmojiApi {
  static Future<Map<String, dynamic>> getEmojis() async {
    // URL
    String url = '$baseUrl/emoji/all';

    // DATA
    var data = null;

    // Make the POST request using DioService
    var response = await DioService.get(url: url, data: data);
    return response;
  }
}
