// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, depend_on_referenced_packages, unnecessary_import, deprecated_member_use, unused_import

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:techblog/Bindings.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Controller/Registerpage_Controller.dart';
import 'package:techblog/Views/ArticlePage.dart';
import 'package:techblog/Views/NewArticlesPage.dart';
import 'package:techblog/Views/ChooseCategories.dart';
import 'package:techblog/Views/MainPage.dart';
import 'package:techblog/Views/RegisterPage_intro.dart';
import 'package:techblog/Views/Splash_Screen.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:get_storage/get_storage.dart';

import 'Views/ArticleEdittingPage.dart';
import 'Views/ArticleManagement.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa'),
        getPages: [
          GetPage(
              name: Routes.mainScreenRoute,
              page: () => MainPage(),
              binding: RegisterBindings()),
          GetPage(
              name: Routes.articleScreenRoute,
              page: () => Articlepage(),
              binding: ArticleBindings()),
          GetPage(
              name: Routes.manageArticleScreenRoute,
              page: () => ArticleManagement(),
              binding: ManageArticlesBindings()),
          GetPage(
              name: Routes.editArticleScreenRoute,
              page: () => ArticleEdittingpage(),
              binding: ManageArticlesBindings()),
        ],
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 2)),
                filled: true,
                fillColor: Colors.white),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return texttheme.titleLarge;
                    }
                    return texttheme.bodyLarge;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return SolidColors.ColorTitle;
                    }
                    return SolidColors.PrimaryColor;
                  })),
            ),
            fontFamily: 'dana',
            textTheme: TextTheme(
                headlineLarge: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: SolidColors.PosterTitle),
                displayLarge: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: SolidColors.PosterSubTitle),
                headlineMedium: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 13.7,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
                headlineSmall: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: SolidColors.MainPageTopics,
                    fontWeight: FontWeight.w700),
                titleLarge: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                bodyLarge: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 13,
                    fontWeight: FontWeight.w300),
                bodyMedium: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 13,
                    color: Color.fromARGB(255, 145, 143, 143),
                    fontWeight: FontWeight.w300),
                displayMedium: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                labelSmall: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w700))),
        home: splashscreen());
  }
}

class Routes {
  static String mainScreenRoute = '/MainScreen';
  static String articleScreenRoute = '/ArticleScreen';
  static String manageArticleScreenRoute = '/manageArticleScreen';
  static String editArticleScreenRoute = '/editArticleScreen';
}
