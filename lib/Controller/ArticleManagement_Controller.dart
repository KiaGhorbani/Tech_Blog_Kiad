// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:get/get.dart';
import 'package:techblog/Models/ArticleInfo_Model.dart';
import 'package:techblog/Models/Articles_Model.dart';
import 'package:techblog/Models/Tags_Model.dart';

import '../Components/URLs.dart';
import '../Services/HTTPMethod_Sevice.dart';

class ArticlemanagementController extends GetxController {
  RxList<TagModel> articlepagetags = RxList.empty();
  RxList<ArticlesModel> articlelist = RxList.empty();
  RxBool loading = false.obs;
  Rx<ArticleInfo> articleinfo = ArticleInfo(
          "در اینجا عنوان قرار میگیرد", "در اینجا توضیحات قرار میگیرد", "")
      .obs;

  @override
  void onInit() {
    super.onInit();
    getmanagedarticle();
  }

  getmanagedarticle() async {
    loading.value = true;

    var response = await HttpMethod().getmethod(Urls.publishedByUser + "1");
    // var response = await HttpMethod().getmethod(
    //     Urls.publishedByUser + GetStorage().read(StorageKeys.user_id));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articlelist.add(ArticlesModel.fromJson(element));
      });
    }

    articlelist.clear();

    loading.value = false;
  }
}
