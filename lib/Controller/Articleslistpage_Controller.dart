// ignore_for_file: file_names

import 'package:get/get.dart';

import '../Components/URLs.dart';
import '../Models/Articles_Model.dart';
import '../Services/HTTPMethod_Sevice.dart';

class ArticleslistpageController extends GetxController {
  RxList<ArticlesModel> articles = RxList();

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getArticleslistItems();
  }

  getArticleslistItems() async {
    loading.value = true;

    var response = await HttpMethod().getmethod(Urls.ArticlepageURL);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articles.add(ArticlesModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
