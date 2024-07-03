import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ForgotPasswordApi {
  static Future<Map<String, dynamic>> forgotpassword({
    required String phone,
  }) async {
    String url = '$baseUrl/forgetpassword';
    var data = {'phone': phone};
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> verifyotp({
    required String otp,
  }) async {
    String url = '$baseUrl/verifyOtp';
    var data = {'otp': otp};
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> updatepassword({
    required String phone,
    required String password,
  }) async {
    String url = '$baseUrl/forgetUpdatePassword';
    var data = {'phone': phone, 'password': password};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
