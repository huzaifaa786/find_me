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

  static Future<Map<String, dynamic>> getGiftedEmojis() async {
    
    // URL
    String url = '$baseUrl/gifted/emojis';

    // DATA
    var data = null;

    // Make the POST request using DioService
    var response = await DioService.get(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> addEmojis({int? id}) async {
    String url = '$baseUrl/add/my/emoji';
    var data = {'id': id};
  
    var response = await DioService.post(url: url, data: data);
    return response;
  }
   static Future<Map<String, dynamic>> myEmojis() async {
    String url = '$baseUrl/myemoji/all';
    var data = null;
    var response = await DioService.get(url: url, data: data);
    return response;
  }
}
