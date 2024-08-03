// ignore_for_file: file_names

class HomePagePosterModel {
  String? id;
  String? title;
  String? image;

  HomePagePosterModel({
    required this.id,
    required this.title,
    required this.image,
  });

  HomePagePosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}
