// ignore_for_file: deprecated_member_use, curly_braces_in_flow_control_structures, unused_local_variable, prefer_const_constructors, sort_child_properties_last, file_names, body_might_complete_normally_nullable, unused_import, prefer_interpolation_to_compose_strings, avoid_print, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Components/MyStrings.dart';
import 'package:techblog/Controller/Registerpage_Controller.dart';
import 'package:techblog/Views/ChooseCategories.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';
import 'package:validators/validators.dart';

import '../Controller/ArticleManagement_Controller.dart';

class ArticleManagement extends StatelessWidget {
  var articlemanagementcontroller = Get.find<ArticlemanagementController>();

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
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
                "مدیریت مقالات ",
                style: texttheme.displayMedium,
              )
            ],
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
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
      ),
      body: Obx(() => articlemanagementcontroller.loading.value
          ? InappLoading()
          : articlemanagementcontroller.articlelist.isNotEmpty
              ? SizedBox(
                  child: ListView.builder(
                      itemCount: articlemanagementcontroller.articlelist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            //Go To Article Page
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 3, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: size.height / 7.5,
                                    width: size.width / 3.6,
                                    //Articles Pics
                                    child: CachedNetworkImage(
                                        imageUrl: articlemanagementcontroller
                                            .articlelist[index].image!,
                                        imageBuilder: (context,
                                                imageProvider) =>
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(16)),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                        placeholder: (context, url) =>
                                            const InappLoading(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                              Icons.image_not_supported,
                                              size: 45,
                                            ))),
                                const SizedBox(
                                  width: 5,
                                ),
                                //Articles Brief Description
                                Column(
                                  children: [
                                    SizedBox(
                                      width: size.width / 1.5,
                                      height: size.height / 18,
                                      child: Text(
                                        articlemanagementcontroller
                                            .articlelist[index].title!,
                                        style: texttheme.displayMedium,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width / 1.6,
                                      child: Row(
                                        children: [
                                          Text(
                                            articlemanagementcontroller
                                                .articlelist[index].author!,
                                            style: texttheme.displayMedium,
                                          ),
                                          const SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            articlemanagementcontroller
                                                .articlelist[index].view!,
                                            style: texttheme.displayMedium,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            CupertinoIcons.eye_fill,
                                            color: Colors.grey,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : EmptyArticleState(texttheme: texttheme)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(Get.width / 3, 50))),
            onPressed: () {
              debugPrint("Write Article Page");
            },
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.editArticleScreenRoute);
              },
              child: Text(
                "بریم برای نوشتن یه مقاله باحال",
              ),
            )),
      ),
    ));
  }
}

class EmptyArticleState extends StatelessWidget {
  const EmptyArticleState({
    super.key,
    required this.texttheme,
  });

  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TechBot
          SvgPicture.asset(
            Assets.images.techBot.path,
            height: 100,
          ),
          //Text
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: Strings.ManageArticle, style: texttheme.titleLarge)),
          ),
        ],
      ),
    );
  }
}
