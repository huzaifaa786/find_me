import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class BlockReportApi {
  static Future<Map<String, dynamic>> blockProfile(int? profileId) async {
    String url = '${baseUrl}/block/profile';
    var data = {"blocked_profile_id": profileId};
    var response = await DioService.post(
      url: url,
      data: data,
    );
    return response;
  }

  static Future<Map<String, dynamic>> reportProfile(
      int? profileId, String reason, String? detail) async {
    String url = '${baseUrl}/report/profile';
    var data = {
      "reported_profile_id": profileId,
      "reason": reason,
      "detail": detail
    };
    var response = await DioService.post(
      url: url,
      data: data,
    );
    return response;
  }

  static Future<Map<String, dynamic>> getBlockUsers() async {
    String url = '${baseUrl}/blocked/user';

    var response = await DioService.get(
      url: url,
    );
    return response;
  }

  static Future<Map<String, dynamic>> unBlockUser(int id) async { 
    String url = '${baseUrl}/unblocked/user/$id';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
