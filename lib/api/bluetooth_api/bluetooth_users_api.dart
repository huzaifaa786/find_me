import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class BluethoohUsersApi {
  static Future<Map<String, dynamic>> getUsersList({
    List<String>? keys,
  }) async {
    //* URL
    String url = '${baseUrl}/find-nearby';

    //* DATA
    var data = {
      'keys': keys,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
