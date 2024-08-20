// ignore_for_file: file_names

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
    });
  }

  Future<dynamic> postmethod(Map<String, dynamic> map, String url) async {
    dio.options.headers["Content-Type"] = "application/json";

    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((value) {
      log(value.headers.toString());
      log(value.data.toString());
      log(value.statusCode.toString());

      return value;
    });
  }
}
