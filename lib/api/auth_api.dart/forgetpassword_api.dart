import 'dart:developer';

import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';


class ForgotPasswordApi {
  static Future<Map<String, dynamic>> forgotpassword({
    String? email,
  }) async {
    //* URL
    String url = '${baseUrl}/forgetpassword';

    //* DATA
    var data = {
      'email': email,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    print('fffffffffffffffffffffffff');
    print(response);
    return response;
  }

  ////////////////////////////////////////////////
  static Future<Map<String, dynamic>> verifyotp({
    String? otp,
  }) async {
    //* URL
    String url = '${baseUrl}/verifyOtp';

    //* DATA
    var data = {
      'otp': otp,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  ////////////////////////////////////////////////
  static Future<Map<String, dynamic>> updatepassword({
    String? email,
    String? password,
  }) async {
    //* URL
    String url = '${baseUrl}/forgetUpdatePassword';

    //* DATA
    var data = {
      'email': email,
      'password': password,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
