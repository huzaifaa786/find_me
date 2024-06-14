import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:find_me/components/helper/loading.dart';
import 'package:find_me/utils/ui_utils.dart';


import 'package:get_storage/get_storage.dart';

class DioService {
  static BaseOptions baseOptions = BaseOptions(
    validateStatus: (status) => [200, 422].contains(status),
  );
  static final Dio _dio = Dio(baseOptions);
  //* POST REQUEST
  static post({required String? url, dynamic data, bool image = false}) async {
    try {
      LoadingHelper.show();
      _setHeaders(image: image);
      log(url.toString());
      log(data.toString());
      log(_dio.options.headers.toString());
      Response response = await _dio.post(
        url!,
        data: data,
        options: Options(
          validateStatus: (status) => [200, 422].contains(status),
        ),
      );
      log(response.toString());
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  //* GET REQUEST
  static Future<Map<String, dynamic>> get({String? url, dynamic data}) async {
    try {
      LoadingHelper.show();
      _setHeaders();
      log(url!);
      Response response = await _dio.get(url,
          queryParameters: data,
          options: Options(
            validateStatus: (status) => [200, 422].contains(status),
          ));
      log(response.toString());
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
      return {};
    }
  }

  //* SET HEADER VARIABLE's
  static void _setHeaders({bool image = false}) {
    GetStorage box = GetStorage();
    var token = box.read('api_token');

    _dio.options.headers['Accept'] = 'application/json';
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    if (image) {
      // _dio.options.headers['Content-Type'] = 'multipart/form-data';
      _dio.options.headers['Content-Type'] = 'application/json';
    } else {
      _dio.options.headers['Content-Type'] = 'application/json';
    }
  }

  //* HANDLE RESPONSE HERE
  static Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      var res = jsonDecode(response.toString());
      if (!res['error']) {
        LoadingHelper.dismiss();
        return jsonDecode(response.toString());
      } else {
        _handleError(res['error_data']);
        return {};
      }
    } else if (response.statusCode == 422) {
      var showError = jsonDecode(response.toString());
      _handleError(showError['message']);
      return {};
    } else {
      _handleError('Failed to load data');
      return {};
    }
  }

  //* HANDLE ERROR MESSAGE HERE
  static void _handleError(dynamic e) {
    LoadingHelper.dismiss();
    UiUtilites.errorSnackbar('Error!', e.toString());
  }
}
