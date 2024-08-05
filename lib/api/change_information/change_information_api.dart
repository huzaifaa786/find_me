import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class ChangeInformationApi {
  static Future<Map<String, dynamic>> ChangeInformation({
    String? firstName,
    String? lastName,
    String? dob,
    String? gender,
     
  }) async {
    
    String url = '${baseUrl}/change/user/info';

    var data = {
     
      'first_name':firstName,
      'last_name':lastName,
      'gender': gender,
      'dob': dob,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
