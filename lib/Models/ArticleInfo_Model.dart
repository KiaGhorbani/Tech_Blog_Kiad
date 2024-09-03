// ignore_for_file: non_constant_identifier_names, file_names

import 'package:techblog/Components/URLs.dart';

class ArticleInfo {
  String? id;
  String? title;
  String? content;
  String? image;
  String? cat_id;
  String? cat_name;
  String? author;
  String? view;
  String? status;
  String? created_at;
  bool? isFavorite;

  ArticleInfo(
    this.title,
    this.content,
    this.image,
  );

  ArticleInfo.fromJson(Map<String, dynamic> element) {
    id = element['info']['id'];
    title = element['info']['title'];
    content = element['info']['content'];
    image = Urls.hostDlURL + element['info']['image'];
    cat_id = element['info']['cat_id'];
    cat_name = element['info']['cat_name'];
    author = element['info']['author'];
    view = element['info']['view'];
    status = element['info']['status'];
    created_at = element['info']['created_at'];
    isFavorite = element['isFavorite'];
  }
}
