import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class GetNotificationsApi { 
  static Future<Map<String, dynamic>> getNotifications() async {
    String url = '$baseUrl/notifications';
    var response = await DioService.get(url: url);
    return response;
  }
}
