// ignore_for_file: use_key_in_widget_constructors, camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:techblog/Views/MainPage.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => MainPage())));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Assets.images.logo.provider(),
              height: 80,
            ),
            SizedBox(
              height: 32,
            ),
            SpinKitWave(
              color: SolidColors.PrimaryColor,
              size: 30,
            )
          ],
        ),
      )),
    );
  }
}
