// ignore_for_file: file_names, unnecessary_import, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/Controller/Homepage_Controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MyColors.dart';

class ProjectDivider extends StatelessWidget {
  const ProjectDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: SolidColors.DividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class Hashtags extends StatelessWidget {
  Hashtags({
    super.key,
    required this.texttheme,
    required this.index,
  });

  final TextTheme texttheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
              colors: GradientColors.HashtagsColor,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(Get.find<HomePageController>().homepagetags[index].title!,
                style: texttheme.headlineMedium)
          ],
        ),
      ),
    );
  }
}

TechBlogGithubLink(String url) async {
  var uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("ERROR while trying to open ${uri.toString()} ");
  }
}

class InappLoading extends StatelessWidget {
  const InappLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeInOut(
      color: SolidColors.PrimaryColor,
    );
  }
}

//AppBar
/*PreferredSize(
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
      ),*/