// ignore_for_file: file_names

class HomePageTagModel {
  String? id;
  String? title;

  HomePageTagModel({
    required this.id,
    required this.title,
  });

  HomePageTagModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
