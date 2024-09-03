// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:techblog/Controller/Articlepage_Controller.dart';
import 'package:techblog/Controller/Articleslistpage_Controller.dart';
import 'package:techblog/Controller/Registerpage_Controller.dart';

import 'Controller/ArticleManagement_Controller.dart';

class ArticleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleslistpageController());

    Get.lazyPut(() => ArticlepageController());
  }
}

class ManageArticlesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticlemanagementController());
  }
}

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterpageController());
  }
}
