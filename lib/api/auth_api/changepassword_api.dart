
import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ChangepasswordApi {
  static Future<Map<String, dynamic>> Changepassword(
   { 
     String? password,
    String?  new_password,
   
    }
  ) async {
    //* URL
    String url = '${baseUrl}/updatePassword';

    //* DATA
    var data = {
      'password': password,
      'new_password':  new_password,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}