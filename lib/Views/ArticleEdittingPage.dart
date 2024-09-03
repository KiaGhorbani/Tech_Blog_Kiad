// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names, prefer_const_constructors_in_immutables, unused_local_variable, prefer_final_fields, unused_field

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Controller/FileManagement_Controller.dart';
import 'package:techblog/Services/Filemanagement.dart';
import 'package:techblog/gen/assets.gen.dart';

import '../Components/MyStrings.dart';
import '../Controller/ArticleManagement_Controller.dart';

class ArticleEdittingpage extends StatelessWidget {
  var articlemanagementController = Get.find<ArticlemanagementController>();
  FileManagementController fileManagementController =
      Get.put(FileManagementController());

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double AppAlignment = size.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(children: [
            //Article Poster
            Stack(
              children: [
                SizedBox(
                  height: Get.height / 3.8,
                  child: fileManagementController.file.value.name == "Null"
                      ? CachedNetworkImage(
                          imageUrl: articlemanagementController
                              .articleinfo.value.image!,
                          imageBuilder: (context, imageProvider) =>
                              Image(image: imageProvider),
                          placeholder: (context, url) => const InappLoading(),
                          errorWidget: (context, url, error) => Image.asset(
                              Assets.images.programming.path,
                              fit: BoxFit.cover))
                      : Image.file(
                          File(
                            fileManagementController.file.value.path!,
                          ),
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 70,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: GradientColors.ArticlePageGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.arrow_back,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 24,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(
                            Icons.bookmark_outline,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 24,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await Share.share(Strings.Share);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.share,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          await pickFile();
                        },
                        child: Container(
                            height: Get.height / 34,
                            width: Get.width / 4,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 68, 4, 87),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "افزودن تصویر",
                                  style: texttheme.labelSmall,
                                ),
                                const Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.white,
                                  size: 10,
                                )
                              ],
                            )),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //Title
            EditTitleHeadline(
              AppAlignment: AppAlignment,
              texttheme: texttheme,
              text: "ویرایش عنوان مقاله",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(articlemanagementController.articleinfo.value.title!,
                  maxLines: 2, style: texttheme.titleLarge),
            ),

            EditTitleHeadline(
              AppAlignment: AppAlignment,
              texttheme: texttheme,
              text: "ویرایش بدنه مقاله",
            ),

            //Body Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                articlemanagementController.articleinfo.value.content!,
                enableCaching: true,
                textStyle: texttheme.bodyLarge,
                onLoadingBuilder: (context, element, loadingProgress) =>
                    const InappLoading(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            EditTitleHeadline(
              AppAlignment: AppAlignment,
              texttheme: texttheme,
              text: "انتخاب دسته بندی",
            ),
          ]),
        ),
      )),
    );
  }
}

class EditTitleHeadline extends StatelessWidget {
  const EditTitleHeadline({
    super.key,
    required this.AppAlignment,
    required this.texttheme,
    required this.text,
  });

  final double AppAlignment;
  final TextTheme texttheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppAlignment),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen.provider(),
            color: SolidColors.MainPageTopics,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: texttheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
