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

  static Future<Map<String, dynamic>> userDetail(id) async {
    String url = '$baseUrl/user/detail/$id';

    //! Make the POST request using ApiService
    var response = await DioService.get(
      url: url,
    );
    return response;
  }

  static Future<Map<String, dynamic>> accountDelete() async {
    String url = '$baseUrl/account/delete';

    //! Make the POST request using ApiService
    var response = await DioService.get(
      url: url,
    );
    return response;
  }

  Future<Map<String, dynamic>> checkAccountStatus() async {
    String url = '$baseUrl/check-user-status';
   
    var response = await DioService.get(
      url: url,
    );
    return response;
  }

  Future<Map<String, dynamic>> logout() async {
    String url = '$baseUrl/logout';
    //! Make the POST request using ApiService
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
