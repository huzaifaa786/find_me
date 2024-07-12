import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ChangePhoneApi {
  static Future<Map<String, dynamic>> changePhone(String phone) async {
    String url = '$baseUrl/change/phone';
    var data = {
      'phone': phone,
    };
    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
