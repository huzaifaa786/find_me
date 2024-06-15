import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class RegisterApi {
  static Future<Map<String, dynamic>> registerUser({
    String? name,
    String? password,
    String? email,
    String? phone,
    String? dob,
  }) async {
    //* URL
    String url = '${baseUrl}/register';

    //* DATA
    // final token = await FirebaseMessaging.instance.getToken();

    var data = {
      'name': name,
      'password': password,
      'phone':phone,
      'email': email,
      // 'login_type': 'EMAIL',
      'dob': dob
      // 'fcm_token': token,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
