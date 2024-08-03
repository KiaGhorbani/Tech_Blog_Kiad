// ignore_for_file: file_names

import 'package:techblog/Components/URLs.dart';

class TopArticlesModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  TopArticlesModel(
      {required this.author,
      required this.id,
      required this.title,
      required this.image,
      required this.catId,
      required this.catName,
      required this.view,
      required this.status,
      required this.createdAt});

  TopArticlesModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = Urls.hostDlURL + element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
