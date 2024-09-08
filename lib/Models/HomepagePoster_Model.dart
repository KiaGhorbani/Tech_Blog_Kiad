// ignore_for_file: file_names

import 'package:techblog/Components/ApiConstants.dart';

class HomePagePosterModel {
  String? id;
  String? title;
  String? image;

  HomePagePosterModel({
    this.id,
    this.title,
    this.image,
  });

  HomePagePosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = Urls.hostDlURL + element["image"];
  }
}
