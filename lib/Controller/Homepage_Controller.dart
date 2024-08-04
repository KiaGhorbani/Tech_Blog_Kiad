// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:techblog/Components/URLs.dart';
import 'package:techblog/Models/HomepagePoster_Model.dart';

import '../Models/HomepageTags_Model.dart';
import '../Models/TopArticles_Model.dart';
import '../Models/TopPodcasts_Model.dart';
import '../Services/HTTPMethod_Sevice.dart';

class HomePageController extends GetxController {
  late Rx<HomePagePosterModel> poster = HomePagePosterModel().obs;
  RxList<HomePageTagModel> homepagetags = RxList();
  RxList<TopArticlesModel> homepagetopvisited = RxList();
  RxList<TopPodcastsModel> homepagetoppodcasts = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;

    var response = await HttpMethod().getmethod(Urls.HomeURL);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        homepagetopvisited.add(TopArticlesModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        homepagetoppodcasts.add(TopPodcastsModel.fromJson(element));
      });

      response.data['tags'].forEach((element) {
        homepagetags.add(HomePageTagModel.fromJson(element));
      });

      poster.value = HomePagePosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
