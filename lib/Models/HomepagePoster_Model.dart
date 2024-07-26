class TopArticles {
  String? id;
  String? title;
  String? image;

  TopArticles({
    required this.id,
    required this.title,
    required this.image,
  });

  TopArticles.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}
