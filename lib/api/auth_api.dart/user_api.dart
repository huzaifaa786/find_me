import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class UserApi {
  static Future<Map<String, dynamic>> getUser() async {
    
    String url = '${baseUrl}/getuser';
    

    //! Make the POST request using ApiService
    var response = await DioService.get(
      url: url, 
    );
    return response;
  }

  static Future<Map<String, dynamic>> showPopup(String beaconId) async {
    String url = '${baseUrl}/showpopup';
    var data = {
      'beacon_id': beaconId,
    };
    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
