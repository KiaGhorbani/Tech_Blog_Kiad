// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, unused_element

import 'package:get/get.dart';

import '../Components/ApiConstants.dart';
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

  getArticleslistItemsfromTags(String id) async {
    articles.clear();
    loading.value = true;

    var response = await HttpMethod().getmethod(Urls.BaseURL +
        "article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articles.add(ArticlesModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
