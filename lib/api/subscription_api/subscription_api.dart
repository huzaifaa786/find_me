import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class SubscriptionApi {
  static Future<Map<String, dynamic>> updateStatus({
    required bool status,
  }) async {
    //* URL
    String url = '${baseUrl}/update/pro/status';

    //* DATA
    var data = {
      'status': status,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
