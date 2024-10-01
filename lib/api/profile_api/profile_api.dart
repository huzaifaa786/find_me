import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ProfileApi {
  static Future<Map<String, dynamic>> updateProfileImage({
    int? userProfileId,
    String? image,
    int? userId,
  }) async {
    // URL
    String url = '$baseUrl/update/profile/image';

    // DATA
    var data = {
      'profile_id': userProfileId,
      'user_id': userId,
      'image':image,

    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> deleteProfileImage({
    int? userProfileId,
    int? userId,
  }) async {
    // URL
    String url = '$baseUrl/delete/profile/image';

    // DATA
    var data = { 
      'profile_id': userProfileId, 
      'user_id': userId,
    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> updateCurrentProfile({
    int? userProfileId,
    int? userId,
  }) async {
    // URL
    String url = '$baseUrl/update/current/profile';

    // DATA
    var data = {
      'profile_id': userProfileId,
      'user_id': userId,
    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> updateProfileName({
    int? userProfileId,
    String? name,
    int? userId,
  }) async {
    // URL
    String url = '$baseUrl/update/profile/name';

    // DATA
    var data = {
      'profile_id': userProfileId,
      'user_id': userId,
      'name': name,
    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> updateProfileBio({
    int? userProfileId,
    String? bio,
  }) async {
    // URL
    String url = '$baseUrl/update/profile/bio';

    // DATA
    var data = {
      'profile_id': userProfileId,
      'bio': bio,
    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

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
    String? linkedin,
    String? website,
  }) async {
    // URL
    String url = '$baseUrl/updateurls';

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
      'linkedin': linkedin,
      'website':website,
    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> submitBusinessCard({
    int? userProfileId,
    String? image,
    String? firstName,
    String? lastName,
    String? company,
    String? job,
    String? phone,
    String? email,
    String? instagram,
    String? x,
    String? website,
    String? facebook,
    String? linkedin,
  }) async {
    // URL
    String url = '$baseUrl/businesscard/create';

    // DATA
    var data = {
      'user_profile_id': userProfileId,
      'image': image,
      'first_name': firstName,
      'last_name': lastName,
      'company': company,
      'job': job,
      'phone': phone,
      'email': email,
      'instagram': instagram,
      'x': x,
      'website': website,
      'facebook': facebook,
      'linkedin': linkedin,
    };

    // Make the POST request using DioService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> deleteBusinessCard({
    int? id,
  }) async {
    // URL
    String url = '$baseUrl/businesscard/delete/$id';

    // DATA
    var data = null;

    // Make the POST request using DioService
    var response = await DioService.get(
      url: url,
      data: data,
    );
    return response;
  }
}
