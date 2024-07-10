// ignore_for_file: file_names, non_constant_identifier_names, empty_constructor_bodies, prefer_typing_uninitialized_variables

class Hashtag {
  String Title;

  Hashtag({required this.Title});
}

class BlogSample {
  int id;
  String ImageURL;
  String Title;
  String Writer;
  String WriterImageURL;
  String Date;
  String Content;
  String Views;

  BlogSample(
      {required this.id,
      required this.ImageURL,
      required this.Title,
      required this.Writer,
      required this.WriterImageURL,
      required this.Date,
      required this.Content,
      required this.Views});
}

class PodcastSample {
  int id;
  var ImageURL;
  String Title;
  String Writer;
  String WriterImageURL;
  String Date;
  String Content;
  String Views;

  PodcastSample(
      {required this.id,
      required this.ImageURL,
      required this.Title,
      required this.Writer,
      required this.WriterImageURL,
      required this.Date,
      required this.Content,
      required this.Views});
}
