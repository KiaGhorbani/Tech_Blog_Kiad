class TopArticles {
  String? id;
  String? title;

  TopArticles({
    required this.id,
    required this.title,
  });

  TopArticles.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
