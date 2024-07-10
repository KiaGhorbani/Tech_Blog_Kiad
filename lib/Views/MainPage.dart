// ignore_for_file: use_key_in_widget_constructors, camel_case_types, file_names, prefer_const_constructors, deprecated_member_use, unnecessary_import, sized_box_for_whitespace, non_constant_identifier_names, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:techblog/Models/Data_Models.dart';
import 'package:techblog/Models/fakedata.dart';
import 'package:techblog/MyColors.dart';
import 'package:techblog/MyStrings.dart';
import 'package:techblog/Views/HomePage.dart';
import 'package:techblog/Views/ProfilePage.dart';
import 'package:techblog/gen/assets.gen.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double AppAlignment = size.width / 10;

    List<Widget> pages = [
      HomePage(
        size: size,
        texttheme: texttheme,
        AppAlignment: AppAlignment,
      ),
      ProfilePage(
        size: size,
        texttheme: texttheme,
        AppAlignment: AppAlignment,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.ScaffoldBg,
          //Mainpage UpperMenu
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
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
              Center(
                child: Positioned.fill(
                  child: pages[selectedIndex],
                ),
              ),
              BottomNav(
                size: size,
                AppAlignment: AppAlignment,
                Screenindex: (int value) {
                  setState(() {
                    selectedIndex = value;
                  });
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
      bottom: 0,
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
                    onPressed: () {},
                    icon: ImageIcon(Assets.icons.bottomNavWrite.provider(),
                        color: Colors.white, size: 30)),
                IconButton(
                    onPressed: () => Screenindex(1),
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
