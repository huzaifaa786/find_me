

import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class LoginApi {
  static Future<Map<String, dynamic>> loginUser({
    String? password,
    String? email,
    String? token,

  }) async {
    //* URL
    String url = '${baseUrl}/login';

    //* DATA
    var data = {
      'email': email,
      'password': password,
      'fcm_token': token,
    };

    //! Make the POST request using `ApiService
    var response = await DioService.post(url: url, data: data);
    print(response);
    return response;
  }
}
