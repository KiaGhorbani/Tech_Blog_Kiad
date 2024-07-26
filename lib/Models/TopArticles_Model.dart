class TopArticles {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  TopArticles(
      {required this.author,
      required this.id,
      required this.title,
      required this.image,
      required this.catId,
      required this.catName,
      required this.view,
      required this.status,
      required this.createdAt});

  TopArticles.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
