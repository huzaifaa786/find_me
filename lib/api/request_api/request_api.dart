import 'package:find_me/models/profile_request_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class RequestApi {
  static Future<Map<String, dynamic>> sendRequest({
    UserModel? user,
    String? requestType,
  }) async {
    //* URL
    String url = '${baseUrl}/send/request';

    //* DATA
    var data = {
      'receiver_profile_id': user!.currentProfile!.id,
      'request_type': requestType,
      'beacon_id': user.beaconId,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> respondRequest({
    ProfileRequestModel? profileRequestModel,
    String? status,
  }) async {
    //* URL
    String url = '${baseUrl}/respond/request';

    //* DATA
    var data = {
      'id': profileRequestModel!.id,
      'status': status,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
