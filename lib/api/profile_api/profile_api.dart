import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ProfileApi {
  static Future<Map<String, dynamic>> updateProfileUrls({
    int? userProfileId,
    String? whatsapp,
    String? instagram,
    String? tiktok,
    String? x,
    String? telegram,
    String? snapchat,
    String? facebook,
    String? youtube,
    String? email,
  }) async {
    // URL
    String url = '${baseUrl}/updateurls';

    // DATA
    var data = {
      'user_profile_id': userProfileId,
      'whatsapp': whatsapp,
      'instagram': instagram,
      'tiktok': tiktok,
      'x': x,
      'telegram': telegram,
      'snapchat': snapchat,
      'facebook': facebook,
      'youtube': youtube,
      'email': email,
    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
