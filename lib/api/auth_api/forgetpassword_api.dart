import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ForgotPasswordApi {
  static Future<Map<String, dynamic>> forgotpassword({
    String? phone,
    String? email,
    String? type,
  }) async {
    String url = '$baseUrl/forgetpassword';
    var data = {
      'phone': phone,
      'email': email,
      'type': type,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> verifyOtp({
    String? type,
    String? otp,
    String? email,
    String? phone,
  }) async {
    String url = '$baseUrl/verify/forget/Otp';
    var data = {
      'type': type,
      'email': email,
      'phone': phone,
      'otp': otp,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
