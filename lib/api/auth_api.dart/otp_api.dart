import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class OtpApi {
  static Future<Map<String, dynamic>> sendOtp({
    String? phone,
  }) async {
    String url = '${baseUrl}/sendOtp';

    //* DATA
    var data = {
      'phone': phone,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> verifyOtp({
    String? phone,
    String? otp,
  }) async {
    String url = '${baseUrl}/verifyOtp';

    //* DATA
    var data = {'phone': phone, 'otp': otp};

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> verifyEmailOtp({
    String? email,
    String? otp,
  }) async {
    String url = '${baseUrl}/email/otp/verify';

    //* DATA
    var data = {'email': email, 'otp': otp};

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
