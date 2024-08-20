// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names, prefer_const_constructors_in_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Views/NewArticlesPage.dart';
import 'package:techblog/gen/assets.gen.dart';

import '../Components/MyStrings.dart';
import '../Controller/Articlepage_Controller.dart';
import '../Controller/Articleslistpage_Controller.dart';

class Articlepage extends StatelessWidget {
  ArticlepageController articlepageController =
      Get.put(ArticlepageController());

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
          () => articlepageController.articleInfo.value.title == null
              ? const InappLoading()
              : Column(children: [
                  //Article Poster
                  Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl:
                              articlepageController.articleInfo.value.image!,
                          imageBuilder: (context, imageProvider) =>
                              Image(image: imageProvider),
                          placeholder: (context, url) => const InappLoading(),
                          errorWidget: (context, url, error) =>
                              Image.asset(Assets.images.programming.path)),
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
                                const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 24,
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
                    ],
                  ),
                  //Title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(articlepageController.articleInfo.value.title!,
                        maxLines: 2, style: texttheme.titleLarge),
                  ),
                  //Author and date
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 6, 0),
                    child: Row(
                      children: [
                        Image(
                          image: Image.asset(Assets.images.profileAvatar.path)
                              .image,
                          height: 34,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(articlepageController.articleInfo.value.author!,
                            style: texttheme.titleMedium),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                            articlepageController.articleInfo.value.created_at!,
                            style: texttheme.bodyMedium),
                      ],
                    ),
                  ),
                  //Body Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HtmlWidget(
                      articlepageController.articleInfo.value.content!,
                      enableCaching: true,
                      textStyle: texttheme.bodyLarge,
                      onLoadingBuilder: (context, element, loadingProgress) =>
                          const InappLoading(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //Related Tags
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: articlepageController.articlepagetags.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            var tagid = articlepageController
                                .articlepagetags[index].id!;
                            await Get.find<ArticleslistpageController>()
                                .getArticleslistItemsfromTags(tagid);

                            Get.to(NewArticlesPage(
                              appbartitle: articlepageController
                                  .articlepagetags[index].title!,
                            ));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Hashtags(
                                texttheme: texttheme,
                                index: index,
                                dependency: Get.find<ArticlepageController>()
                                    .articlepagetags[index]
                                    .title!,
                              )),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //Related Blogs Headline
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          Strings.RelatedBlogs,
                          style: texttheme.headlineSmall,
                        )
                      ],
                    ),
                  ),

                  //Related Blogs
                  SizedBox(
                    height: size.height / 4.1,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: articlepageController.relatedarticles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              articlepageController.getArticlepageItems(
                                  articlepageController
                                      .relatedarticles[index].id!);
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 5, 8),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                          height: size.height / 5.3,
                                          width: size.width / 2.5,
                                          child: CachedNetworkImage(
                                              imageUrl: articlepageController
                                                  .relatedarticles[index]
                                                  .image!,
                                              imageBuilder: (context,
                                                      imageProvider) =>
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                              placeholder: (context, url) =>
                                                  const InappLoading(),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  const Icon(
                                                    Icons.image_not_supported,
                                                    size: 45,
                                                  ))),
                                      Positioned(
                                        bottom: 8,
                                        right: 0,
                                        left: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              articlepageController
                                                  .relatedarticles[index]
                                                  .author!,
                                              style: texttheme.displayLarge,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  articlepageController
                                                      .relatedarticles[index]
                                                      .view!,
                                                  style: texttheme.displayLarge,
                                                ),
                                                const SizedBox(width: 8),
                                                const Icon(
                                                  CupertinoIcons.eye_fill,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: index == 0 ? AppAlignment : 15),
                                  child: SizedBox(
                                    width: size.width / 2.5,
                                    child: Text(
                                      articlepageController
                                          .relatedarticles[index].title!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: texttheme.displayMedium,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ]),
        ),
      )),
    );
  }
}
