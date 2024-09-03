// ignore_for_file: file_names, body_might_complete_normally_catch_error

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class HttpMethod {
  Dio dio = Dio();
  Future<dynamic> getmethod(String url) async {
    Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";

    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      log(response.toString());

      return response;
    }).catchError((error) {
      if (error is DioError) {
        return error.response!;
      }
    });
  }

  Future<dynamic> postmethod(Map<String, dynamic> map, String url) async {
    dio.options.headers["Content-Type"] = "application/json";

    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());

      return response;
    }).catchError((error) {
      if (error is DioError) {
        return error.response!;
      }
    });
  }
}
