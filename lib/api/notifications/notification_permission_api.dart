import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class NotificationPermissionApi {
  static Future<Map<String, dynamic>> getPermissions() async {
    String url = '$baseUrl/notification/permission';
    var response = await DioService.get(url: url);
    return response;
  }

  static Future<Map<String, dynamic>> updatePermissions(
      {required bool emoji,
      required bool profile,
      required bool social}) async {
    String url = '$baseUrl/update/permission';
    var data = {"emoji": emoji, "profile": profile, "social": social};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
