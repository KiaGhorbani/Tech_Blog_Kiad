// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use, must_be_immutable, unused_element, dead_code

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Components/MyColors.dart';

import '../Controller/Homepage_Controller.dart';
import '../Models/fakedata.dart';
import '../Components/MyStrings.dart';
import '../gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    required this.size,
    required this.texttheme,
    required this.AppAlignment,
  });

  HomePageController homePageController = Get.put(HomePageController());

  final Size size;
  final TextTheme texttheme;
  final double AppAlignment;

  @override
  Widget build(BuildContext context) {
    Widget topVisitedBlogs() {
      return SizedBox(
        height: size.height / 4.1,
        child: Obx(
          () => ListView.builder(
            itemCount: homePageController.homepagetopvisited.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
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
                                    const SpinKitThreeInOut(
                                      color: SolidColors.PrimaryColor,
                                    ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    padding:
                        EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
                    child: SizedBox(
                      width: size.width / 2.5,
                      child: Text(
                        BlogList[index].Title,
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
      );
    }

    Widget topVisitedPodcasts() {
      return SizedBox(
        height: size.height / 4.1,
        child: Obx(
          () => ListView.builder(
            itemCount: homePageController.homepagetoppodcasts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
                    child: Stack(
                      children: [
                        SizedBox(
                            height: size.height / 5.3,
                            width: size.width / 2.5,
                            child: CachedNetworkImage(
                                imageUrl: homePageController
                                    .homepagetoppodcasts[index].poster!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                placeholder: (context, url) =>
                                    const SpinKitThreeInOut(
                                      color: SolidColors.PrimaryColor,
                                    ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homePageController
                                    .homepagetoppodcasts[index].publisher!,
                                style: texttheme.displayLarge,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homePageController
                                        .homepagetoppodcasts[index].view!,
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
                    padding:
                        EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
                    child: SizedBox(
                      width: size.width / 2.5,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          homePageController.homepagetoppodcasts[index].title!,
                          style: texttheme.titleLarge,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HomePagePoster(size: size, texttheme: texttheme),
          HomePageTagList(AppAlignment: AppAlignment, texttheme: texttheme),
          const SizedBox(
            height: 32,
          ),
          HomePageHotBlogHeadline(
              AppAlignment: AppAlignment, texttheme: texttheme),
          const SizedBox(
            height: 5,
          ),
          topVisitedBlogs(),
          const SizedBox(
            height: 32,
          ),
          HomePagePodcastHeadline(
              AppAlignment: AppAlignment, texttheme: texttheme),
          const SizedBox(
            height: 5,
          ),
          topVisitedPodcasts(),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}

class HomePagePodcastHeadline extends StatelessWidget {
  const HomePagePodcastHeadline({
    super.key,
    required this.AppAlignment,
    required this.texttheme,
  });

  final double AppAlignment;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppAlignment),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePodcast.provider(),
            color: SolidColors.MainPageTopics,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            Strings.Hotpodcasts,
            style: texttheme.headlineSmall,
          )
        ],
      ),
    );
  }
}

class HomePageHotBlogHeadline extends StatelessWidget {
  const HomePageHotBlogHeadline({
    super.key,
    required this.AppAlignment,
    required this.texttheme,
  });

  final double AppAlignment;
  final TextTheme texttheme;

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
            Strings.HotBlogs,
            style: texttheme.headlineSmall,
          )
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.AppAlignment,
    required this.texttheme,
  });

  final double AppAlignment;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: Hashtaglist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? AppAlignment : 20, 8),
              child: Hashtags(
                texttheme: texttheme,
                index: index,
              ));
        },
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.texttheme,
  });

  final Size size;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: size.width / 1.25,
            height: size.height / 4.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage(Posterwidgets["Poster Image"]),
                    fit: BoxFit.cover)),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                    colors: GradientColors.HomePosterCoverGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      Posterwidgets["Author"] +
                          " - " +
                          Posterwidgets["Publish Time"],
                      style: texttheme.displayLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          Posterwidgets["Views"],
                          style: texttheme.displayLarge,
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          CupertinoIcons.eye_fill,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      Posterwidgets["Summary"],
                      style: texttheme.headlineLarge,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
