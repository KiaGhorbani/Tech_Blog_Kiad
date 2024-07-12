// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, depend_on_referenced_packages, unnecessary_import, deprecated_member_use, unused_import

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/MyColors.dart';
import 'package:techblog/Views/RegisterPage_intro.dart';
import 'package:techblog/Views/Splash_Screen.dart';
import 'package:techblog/gen/assets.gen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', '') //farsi
        ],
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                // رنگ پس‌زمینه دکمه
                foregroundColor:
                    MaterialStateProperty.all(Colors.white), // رنگ متن دکمه
              ),
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
                    fontSize: 14,
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
                    fontWeight: FontWeight.w300))),
        home: RegisterpageIntro());
  }
}
