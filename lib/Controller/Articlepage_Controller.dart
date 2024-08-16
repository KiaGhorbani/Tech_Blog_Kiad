// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:get/get.dart';

import '../Components/URLs.dart';
import '../Models/ArticleInfo_Model.dart';
import '../Models/Articles_Model.dart';
import '../Models/Tags_Model.dart';
import '../Services/HTTPMethod_Sevice.dart';

class ArticlepageController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = 0.obs;
  Rx<ArticleInfo> articleInfo = ArticleInfo().obs;
  RxList<TagModel> articlepagetags = RxList();
  RxList<ArticlesModel> relatedarticles = RxList();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  getArticlepageItems() async {
    loading.value = true;

    var userid = '';
    var response = await HttpMethod().getmethod(
        Urls.BaseURL + "article/get.php?command=info&id=$id&user_id=$userid");

    if (response.statusCode == 200) {
      articleInfo.value = ArticleInfo.fromJson(response.data);

      response.data['tags'].forEach((element) {
        articlepagetags.add(TagModel.fromJson(element));
      });

      response.data['related'].forEach((element) {
        relatedarticles.add(ArticlesModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
