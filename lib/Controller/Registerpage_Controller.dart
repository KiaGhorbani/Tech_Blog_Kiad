// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, file_names, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/Components/Storages.dart';
import 'package:techblog/Components/URLs.dart';
import 'package:techblog/Services/HTTPMethod_Sevice.dart';
import 'package:techblog/Views/MainPage.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

import '../Views/RegisterPage_intro.dart';

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

    debugPrint(response.toString());
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
    debugPrint(response.data.toString());

    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKeys.token, response.data['token']);
        box.write(StorageKeys.user_id, response.data['user_id']);

        print("I READ THE TOKEN:::" + box.read(StorageKeys.token));
        print("I READ THE USERID:::" + box.read(StorageKeys.user_id));

        Get.offAll(MainPage());
        break;

      case 'incorrect_code':
        Get.snackbar('Error', "کد فعالسازی اشتباه است");
        break;

      case 'expired':
        Get.snackbar('Error', "کد فعالسازی منقضی شده است");
        break;
    }
  }

  CheckLogin() {
    if (GetStorage().read(StorageKeys.token) == null) {
      Get.to(RegisterpageIntro());
    } else {
      RouteToPost();
    }
  }

  RouteToPost() {
    Get.bottomSheet(Container(
        height: Get.height / 3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  Assets.images.techBot.path,
                  height: 50,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "دونسته هات رو با بقیه به اشتراک بذار ...",
              )
            ]),
            SizedBox(
              height: 20,
            ),
            Text("""فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار.."""),
            SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              GestureDetector(
                onTap: () {
                  // debugPrint("Article Page");
                  Get.toNamed(Routes.manageArticleScreenRoute);
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageIcon(
                          Assets.icons.bluePen.provider(),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('مدیریت مقاله')
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint("Podcast Page");
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageIcon(
                          Assets.icons.bluePodcast.provider(),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('مدیریت پادکست')
                      ]),
                ),
              ),
            ])
          ],
        )));
  }
}
