// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/Components.dart';
import 'package:techblog/MyColors.dart';

import '../Models/fakedata.dart';
import '../MyStrings.dart';
import '../gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.size,
    required this.texttheme,
    required this.AppAlignment,
  });

  final Size size;
  final TextTheme texttheme;
  final double AppAlignment;

  @override
  Widget build(BuildContext context) {
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
          HomePageHotBlogs(
              size: size, AppAlignment: AppAlignment, texttheme: texttheme),
          const SizedBox(
            height: 32,
          ),
          HomePagePodcastHeadline(
              AppAlignment: AppAlignment, texttheme: texttheme),
          const SizedBox(
            height: 5,
          ),
          HomePageHotPodcast(
              size: size, AppAlignment: AppAlignment, texttheme: texttheme),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}

class HomePageHotPodcast extends StatelessWidget {
  const HomePageHotPodcast({
    super.key,
    required this.size,
    required this.AppAlignment,
    required this.texttheme,
  });

  final Size size;
  final double AppAlignment;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
        itemCount: PodcastList.getRange(0, 4).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: (PodcastList[index].ImageURL),
                                fit: BoxFit.cover)),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: GradientColors.BlogListGradient,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            PodcastList[index].Writer,
                            style: texttheme.displayLarge,
                          ),
                          Row(
                            children: [
                              Text(
                                PodcastList[index].Views,
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
                padding: EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
                child: SizedBox(
                  width: size.width / 2.5,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      PodcastList[index].Title,
                      style: texttheme.titleLarge,
                    ),
                  ),
                ),
              )
            ],
          );
        },
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

class HomePageHotBlogs extends StatelessWidget {
  const HomePageHotBlogs({
    super.key,
    required this.size,
    required this.AppAlignment,
    required this.texttheme,
  });

  final Size size;
  final double AppAlignment;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
        itemCount: BlogList.getRange(0, 6).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(BlogList[index].ImageURL),
                                fit: BoxFit.cover)),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: GradientColors.BlogListGradient,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            BlogList[index].Writer,
                            style: texttheme.displayLarge,
                          ),
                          Row(
                            children: [
                              Text(
                                BlogList[index].Views,
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
                padding: EdgeInsets.only(right: index == 0 ? AppAlignment : 15),
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
