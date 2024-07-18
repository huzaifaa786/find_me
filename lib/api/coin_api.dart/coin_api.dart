import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class CoinApi {
  static Future<Map<String, dynamic>> getCoinPackages() async {
    // URL
    String url = '$baseUrl/get/packages';

    // DATA
    var data = null;

    // Make the POST request using DioService
    var response = await DioService.get(url: url, data: data);
    return response;
  }
}
