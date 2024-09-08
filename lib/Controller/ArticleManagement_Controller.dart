// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, unused_import

import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/Components/commands.dart';
import 'package:techblog/Components/Storages.dart';
import 'package:techblog/Models/ArticleInfo_Model.dart';
import 'package:techblog/Models/Articles_Model.dart';
import 'package:techblog/Models/Tags_Model.dart';

import '../Components/ApiConstants.dart';
import '../Services/HTTPMethod_Sevice.dart';
import 'FileManagement_Controller.dart';

class ArticlemanagementController extends GetxController {
  RxList<TagModel> articlepagetags = RxList.empty();
  RxList<ArticlesModel> articlelist = RxList.empty();
  RxBool loading = false.obs;
  Rx<ArticleInfo> articleinfo = ArticleInfo(
          "در اینجا عنوان قرار میگیرد", "در اینجا توضیحات قرار میگیرد", "")
      .obs;

  TextEditingController titleTextedittingcontroller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getmanagedarticle();
  }

  getmanagedarticle() async {
    loading.value = true;

    // var response = await HttpMethod().getmethod(Urls.publishedByUser + "1");
    var response = await HttpMethod().getmethod(
        Urls.publishedByUser + GetStorage().read(StorageKeys.user_id));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articlelist.add(ArticlesModel.fromJson(element));
      });
    }

    articlelist.clear();

    loading.value = false;
  }

  updateArticleTitle() {
    articleinfo.update(
      (val) {
        val!.title = titleTextedittingcontroller.text;
      },
    );

    Get.back();
  }

  storeArticle() async {
    loading.value = true;

    var filecontroller = Get.find<FileManagementController>();

    Map<String, dynamic> map = {
      PostArticleMapKeys.title: articleinfo.value.title,
      PostArticleMapKeys.content: articleinfo.value.content,
      PostArticleMapKeys.cat_id: articleinfo.value.cat_id,
      PostArticleMapKeys.tag_list: "[]",
      PostArticleMapKeys.user_id: GetStorage().read(StorageKeys.user_id),
      PostArticleMapKeys.image:
          await dio.MultipartFile.fromFile(filecontroller.file.value.path!),
      PostArticleMapKeys.command: PostArticleCommands.store,
    };

    var response = await HttpMethod().postmethod(map, Urls.PostArticle);
    log(response.data.toString());

    loading.value = false;
  }
}
