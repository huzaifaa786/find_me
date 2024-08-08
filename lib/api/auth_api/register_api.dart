import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class RegisterApi {
  static Future<Map<String, dynamic>> registerUser({
    String? name,
    String? firstName,
    String? lastName,
    String? password,
    String? email,
    String? phone,
    String? dob,
    String? gender,
    String? beaconId, 
  }) async {
    //* URL
    String url = '${baseUrl}/register';

    //* DATA
    final token = await FirebaseMessaging.instance.getToken();
    var data = {
      'name': name,
      'password': password,
      'phone':phone,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      // 'login_type': 'EMAIL',
      'dob': dob,
      'beacon_id': beaconId,
      'fcm_token': token,    //! 1233456789 Yeee Remove kr dena just dekhny k liy lagaya k yee code ma ny add kiaaa ha
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  googleLogin(String email, String name) async {
    var url = '$baseUrl/verifyemail';
    final token = await FirebaseMessaging.instance.getToken();

    var data = {
      'email': email,
      'name': name,
      'login_type': 'GOOGLE',
      'fcm_token': token,
    };

    var response = await DioService.post(url: url, data: data);
    return response;
  }


}
