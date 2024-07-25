// ignore_for_file: non_constant_identifier_names

import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class PrivacyApi {
  static Future<Map<String, dynamic>> profilePrivacy({
    bool? publicProfile,
    bool? publicSocial,
    String? profileId,
  }) async {
    String url = '${baseUrl}/update/profile/privacy';
    var data = {
      'public_profile': publicProfile,
      'public_social': publicSocial,
      'profile_id': profileId,
    };

    var response = await DioService.post(url: url, data: data); 
    return response;
  }
}
