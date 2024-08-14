// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/gen/assets.gen.dart';

import '../Components/MyStrings.dart';
import '../Controller/Homepage_Controller.dart';

class Articlepage extends StatelessWidget {
  HomePageController homePageController = Get.put(HomePageController());

  Articlepage({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double AppAlignment = size.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          //Article Poster
          Stack(
            children: [
              CachedNetworkImage(
                  imageUrl: "",
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 24,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.bookmark_outline,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.share,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 24,
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
            child: Text(
                "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
                maxLines: 2,
                style: texttheme.titleLarge),
          ),
          //Author and date
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 6, 0),
            child: Row(
              children: [
                Image(
                  image: Image.asset(Assets.images.profileAvatar.path).image,
                  height: 34,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("فاطمه امیری", style: texttheme.titleMedium),
                const SizedBox(
                  width: 25,
                ),
                Text("تاریخ", style: texttheme.bodyMedium),
              ],
            ),
          ),
          //Body Text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HtmlWidget(
              '''
                    <h1>Heading 1</h1>
                    <h2>Heading 2</h2>
                    <h3>Heading 3</h3>
                    <h4>Heading 4</h4>
                    <h5>Heading 5</h5>
                    <h6>Heading 6</h6>
                    ''',
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
              itemCount: homePageController.homepagetags.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Hashtags(
                      texttheme: texttheme,
                      index: index,
                    ));
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
                itemCount: homePageController.homepagetopvisited.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 5, 8),
                        child: Stack(
                          children: [
                            SizedBox(
                                height: size.height / 5.3,
                                width: size.width / 2.5,
                                child: CachedNetworkImage(
                                    imageUrl: homePageController
                                        .homepagetopvisited[index].image!,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
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
                            Positioned(
                              bottom: 8,
                              right: 0,
                              left: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    homePageController
                                        .homepagetopvisited[index].author!,
                                    style: texttheme.displayLarge,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homePageController
                                            .homepagetopvisited[index].view!,
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
                            homePageController.homepagetopvisited[index].title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: texttheme.displayMedium,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ]),
      )),
    );
  }
}
