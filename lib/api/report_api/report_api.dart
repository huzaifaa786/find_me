import 'package:find_me/services/dio_service.dart';
import 'package:find_me/utils/base_url.dart';

class ReportApi {
  static Future<Map<String, dynamic>> ReportProblem({
    String? image,
    String? desc,
    String? user_id,
    var data,
  }) async {
    //* URL
    String url = '${baseUrl}/report/problem';

    if (image == null)
      data = {
        // 'image': image ,
        'desc': desc,
        'user_id': user_id,
      };
    else
      data = {
        'image': image,
        'desc': desc ?? null,
        'user_id': user_id,
      };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
