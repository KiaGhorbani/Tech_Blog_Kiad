// ignore_for_file: file_names

import 'package:techblog/Components/URLs.dart';

class TopPodcastsModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? status;
  String? publisher;
  String? view;
  String? createdAt;

  TopPodcastsModel(
      {required this.id,
      required this.title,
      required this.poster,
      required this.catName,
      required this.status,
      required this.publisher,
      required this.view,
      required this.createdAt});

  TopPodcastsModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = Urls.hostDlURL + element["poster"];
    catName = element["cat_name"];
    status = element["status"];
    publisher = element["author"];
    view = element["view"];
    createdAt = element["created_at"];
  }
}
