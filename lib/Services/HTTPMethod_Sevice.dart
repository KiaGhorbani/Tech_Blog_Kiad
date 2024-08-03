// ignore_for_file: file_names

import 'dart:developer';

import 'package:dio/dio.dart';

class HttpMethod {
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
}
