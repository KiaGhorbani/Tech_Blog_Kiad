// ignore_for_file: unused_local_variable, unnecessary_import, file_names, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Controller/Articleslistpage_Controller.dart';
import 'package:techblog/Views/ArticlePage.dart';

import '../Controller/Articlepage_Controller.dart';

class NewArticlesPage extends StatelessWidget {
  NewArticlesPage({super.key});

  ArticleslistpageController articleslistController =
      Get.put(ArticleslistpageController());
  ArticlepageController articlepageController =
      Get.put(ArticlepageController());

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
            elevation: 0,
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
      body: Obx(
        () => SizedBox(
          child: ListView.builder(
              itemCount: articleslistController.articles.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    articlepageController.id.value =
                        int.parse(articleslistController.articles[index].id!);
                    Get.to(Articlepage());
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
                                imageUrl: articleslistController
                                    .articles[index].image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
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
                                articleslistController.articles[index].title!,
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
                                    articleslistController
                                        .articles[index].author!,
                                    style: texttheme.displayMedium,
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    articleslistController
                                        .articles[index].view!,
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
        ),
      ),
    ));
  }
}
