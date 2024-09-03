// ignore_for_file: use_key_in_widget_constructors, camel_case_types, file_names, prefer_const_constructors, deprecated_member_use, unnecessary_import, sized_box_for_whitespace, non_constant_identifier_names, unused_import, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Components/URLs.dart';
import 'package:techblog/Controller/Registerpage_Controller.dart';
import 'package:techblog/Models/Data_Models.dart';
import 'package:techblog/Models/fakedata.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Components/MyStrings.dart';
import 'package:techblog/Services/HTTPMethod_Sevice.dart';
import 'package:techblog/Views/HomePage.dart';
import 'package:techblog/Views/ProfilePage.dart';
import 'package:techblog/Views/RegisterPage_intro.dart';
import 'package:techblog/gen/assets.gen.dart';

final GlobalKey<ScaffoldState> RamKey = GlobalKey();

class MainPage extends StatelessWidget {
  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double AppAlignment = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: RamKey,
        drawer: Drawer(
            backgroundColor: SolidColors.ScaffoldBg,
            child: Padding(
              padding: EdgeInsets.only(right: AppAlignment, left: AppAlignment),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 3,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: texttheme.titleLarge,
                    ),
                    onTap: () {},
                  ),
                  Divider(
                    color: SolidColors.DividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "درباره تک بلاگ",
                      style: texttheme.titleLarge,
                    ),
                    onTap: () {
                      TechBlogGithubLink(Strings.TechBlogGithub);
                    },
                  ),
                  Divider(
                    color: SolidColors.DividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "اشتراک گذاری تک بلاگ",
                      style: texttheme.titleLarge,
                    ),
                    onTap: () async {
                      await Share.share(Strings.Share);
                    },
                  ),
                  Divider(
                    color: SolidColors.DividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "تک بلاگ در گیت هاب",
                      style: texttheme.titleLarge,
                    ),
                    onTap: () {
                      TechBlogGithubLink(Strings.TechBlogGithub);
                    },
                  ),
                  Divider(
                    color: SolidColors.DividerColor,
                  ),
                ],
              ),
            )),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.ScaffoldBg,
          //Mainpage UpperMenu
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  RamKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Obx(
                  () => IndexedStack(
                    index: selectedIndex.value,
                    children: [
                      HomePage(
                        size: size,
                        texttheme: texttheme,
                        AppAlignment: AppAlignment,
                      ),
                      RegisterpageIntro(),
                      ProfilePage(
                        size: size,
                        texttheme: texttheme,
                        AppAlignment: AppAlignment,
                      ),
                    ],
                  ),
                ),
              ),
              BottomNav(
                size: size,
                AppAlignment: AppAlignment,
                Screenindex: (int value) {
                  selectedIndex.value = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav(
      {super.key,
      required this.size,
      required this.AppAlignment,
      required this.Screenindex});

  final Size size;
  final double AppAlignment;
  final Function(int) Screenindex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppAlignment / 2,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 13,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.BottomNavBG,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: AppAlignment, left: AppAlignment),
          child: Container(
            height: size.height / 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(
                    colors: GradientColors.BottomNav,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => Screenindex(0),
                    icon: ImageIcon(Assets.icons.bottomNavHome.provider(),
                        color: Colors.white, size: 30)),
                IconButton(
                    onPressed: () {
                      Get.find<RegisterpageController>().CheckLogin();
                    },
                    icon: ImageIcon(Assets.icons.bottomNavWrite.provider(),
                        color: Colors.white, size: 30)),
                IconButton(
                    onPressed: () => Screenindex(2),
                    icon: ImageIcon(Assets.icons.bottomNavUser.provider(),
                        color: Colors.white, size: 30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
