// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use, unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/Components.dart';
import 'package:techblog/MyColors.dart';

import '../Models/fakedata.dart';
import '../MyStrings.dart';
import '../gen/assets.gen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
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
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ProfileImage
              Image(
                image: Assets.images.profileAvatar.provider(),
                height: 100,
              ),
              const SizedBox(
                height: 12,
              ),
              //ProfileEdit
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    Assets.icons.bluePen.provider(),
                    color: SolidColors.MainPageTopics,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    Strings.ProfileEdit,
                    style: texttheme.headlineSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              //Name And Gmail
              Text(
                "فاطمه امیری",
                style: texttheme.titleLarge,
              ),
              Text(
                "fatemeamiri@gmail.com",
                style: texttheme.titleLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              //Options
              ProjectDivider(size: size),
              InkWell(
                splashColor: SolidColors.PrimaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      Strings.MyFavBlogs,
                      style: texttheme.titleLarge,
                    ),
                  ),
                ),
              ),
              ProjectDivider(size: size),
              InkWell(
                splashColor: SolidColors.PrimaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      Strings.MyFavPodcasts,
                      style: texttheme.titleLarge,
                    ),
                  ),
                ),
              ),
              ProjectDivider(size: size),
              InkWell(
                splashColor: SolidColors.PrimaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      Strings.Signout,
                      style: texttheme.titleLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 300,
              )
            ],
          ),
        ));
  }
}
