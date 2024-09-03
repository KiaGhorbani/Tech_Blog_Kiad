// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:get/get.dart';

import '../Components/URLs.dart';
import '../Models/ArticleInfo_Model.dart';
import '../Models/Articles_Model.dart';
import '../Models/Tags_Model.dart';
import '../Services/HTTPMethod_Sevice.dart';
import '../Views/ArticlePage.dart';

class ArticlepageController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = 0.obs;
  Rx<ArticleInfo> articleInfo = ArticleInfo(null, null, null).obs;
  RxList<TagModel> articlepagetags = RxList();
  RxList<ArticlesModel> relatedarticles = RxList();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  getArticlepageItems(var id) async {
    articleInfo = ArticleInfo(null, null, null).obs;

    loading.value = true;

    var userid = '';
    var response = await HttpMethod().getmethod(
        Urls.BaseURL + "article/get.php?command=info&id=$id&user_id=$userid");

    if (response.statusCode == 200) {
      articleInfo.value = ArticleInfo.fromJson(response.data);

      articlepagetags.clear();
      response.data['tags'].forEach((element) {
        articlepagetags.add(TagModel.fromJson(element));
      });

      relatedarticles.clear();
      response.data['related'].forEach((element) {
        relatedarticles.add(ArticlesModel.fromJson(element));
      });

      loading.value = false;

      Get.to(Articlepage());
    }
  }
}
