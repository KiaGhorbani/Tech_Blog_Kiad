// ignore_for_file: non_constant_identifier_names, file_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/Components/Components.dart';
import 'package:techblog/Models/fakedata.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Components/MyStrings.dart';
import 'package:techblog/gen/assets.gen.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double AppAlignment = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: AppAlignment, right: AppAlignment),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                //Techbot
                SvgPicture.asset(
                  Assets.images.techBot.path,
                  height: 100,
                ),
                const SizedBox(height: 30),
                //Congrats
                Text(
                  Strings.RegistrationCompleted,
                  style: texttheme.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                //Enter your name
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      //alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: texttheme.bodyMedium),
                ),
                const SizedBox(
                  height: 32,
                ),
                //Enter Categories
                Text(
                  Strings.EnterCats,
                  style: texttheme.titleLarge,
                ),
                //Categories List
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemCount: Hashtaglist.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (ChosenCats.contains(Hashtaglist[index])) {
                                print("${Hashtaglist[index]} already exists");
                              } else {
                                ChosenCats.add(Hashtaglist[index]);
                              }
                            });
                          },
                          child: Hashtags(
                            texttheme: texttheme,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //Arrow
                const SizedBox(
                  height: 32,
                ),
                Image.asset(
                  Assets.images.arrow.path,
                  scale: 3,
                ),
                //Chosen Categories List
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemCount: ChosenCats.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.25),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: SolidColors.ChosenListColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(ChosenCats[index].Title,
                                    style: texttheme.titleLarge),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      ChosenCats.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //Proceed
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "ادامه",
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
