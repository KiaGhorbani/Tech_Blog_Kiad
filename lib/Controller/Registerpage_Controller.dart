// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, file_names, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/Components/Storages.dart';
import 'package:techblog/Components/URLs.dart';
import 'package:techblog/Services/HTTPMethod_Sevice.dart';
import 'package:techblog/Views/MainPage.dart';

class RegisterpageController extends GetxController {
  TextEditingController EmailTextEditingController = TextEditingController();
  TextEditingController VerifyCodetextEditingController =
      TextEditingController();
  var email = '';
  var user_id = '';

  Register() async {
    Map<String, dynamic> map = {
      'email': EmailTextEditingController.text,
      'command': 'register'
    };

    var response = await HttpMethod().postmethod(map, Urls.Registration);
    email = EmailTextEditingController.text;
    user_id = response.data['user_id'];

    print(response);
  }

  Verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': user_id,
      'code': VerifyCodetextEditingController.text,
      'command': 'verify',
    };
    print(map);
    var response = await HttpMethod().postmethod(map, Urls.Registration);
    print(response.data);

    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(user_id, response.data['user_id']);

      print("I READ THE TOKEN:::" + box.read(token));
      print("I READ THE USERID:::" + box.read(user_id));

      Get.to(MainPage());
    } else {
      log("erorr");
    }
  }
}
