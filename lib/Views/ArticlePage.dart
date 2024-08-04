// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/Components/MyColors.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 7),
          child: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Text(
                "مقالات جدید ",
                style: texttheme.displayMedium,
              )
            ],
            leading: Container(
              decoration: BoxDecoration(
                  color: SolidColors.PrimaryColor.withAlpha(150),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
