import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ChangeEmailApi {
  static Future<Map<String, dynamic>> changeEmail(String email) async {
    String url = '$baseUrl/change/email';
    var data = {
      'email': email,
    };
    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
