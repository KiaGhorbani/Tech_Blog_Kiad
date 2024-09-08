// ignore_for_file: prefer_interpolation_to_compose_strings, constant_identifier_names, file_names

class Urls {
  static const BaseURL = "https://techblog.sasansafari.com/Techblog/api/";
  static const hostDlURL = "https://techblog.sasansafari.com";
  static const HomeURL = BaseURL + "home/?command=index";
  static const publishedByUser =
      BaseURL + "article/get.php?command=published_by_me&user_id=";
  static const ArticlepageURL =
      BaseURL + "article/get.php?command=new&user_id=";
  static const Registration = BaseURL + "register/action.php";
  static const PostArticle = BaseURL + "article/post.php";
}

class PostArticleMapKeys {
  static const title = "title";
  static const content = "content";
  static const cat_id = "cat_id";
  static const tag_list = "tag_list";
  static const user_id = "user_id";
  static const image = "image";
  static const command = "command";
}
