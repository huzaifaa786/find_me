import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class NewPasswordApi {
  static Future<Map<String, dynamic>> NewPassword(
   { 
    String? type,
     String?  email,
    String? phone,
    String? password,
    }
  ) async {
    //* URL
    String url = '${baseUrl}/forgetUpdatePassword';

    //* DATA
    var data = {
      'type':type,
     ' email':email,
     'phone': phone,
      'password': password,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}