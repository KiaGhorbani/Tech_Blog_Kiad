// ignore_for_file: file_names

import 'package:get/get.dart';

import '../Components/URLs.dart';
import '../Services/HTTPMethod_Sevice.dart';

class ArticlepageController extends GetxController {
  RxBool loading = false.obs;
  RxInt userid = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  getArticlepageItems() async {
    loading.value = true;
    //TODO var response = await HttpMethod().getmethod(Urls.HomeURL + userid);

    var response = await HttpMethod().getmethod(Urls.ArticlepageURL);

    if (response.statusCode == 200) {
      response.data.forEach((element) {});

      loading.value = false;
    }
  }
}
