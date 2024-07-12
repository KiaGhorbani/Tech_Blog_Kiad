// ignore_for_file: deprecated_member_use, curly_braces_in_flow_control_structures, unused_local_variable, prefer_const_constructors, sort_child_properties_last, file_names, body_might_complete_normally_nullable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/MyColors.dart';
import 'package:techblog/MyStrings.dart';
import 'package:techblog/gen/assets.gen.dart';

class RegisterpageIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
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
                      text: Strings.Regintro, style: texttheme.titleLarge)),
            ),
            //Button
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "بزن بریم",
                  ),
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return texttheme.titleLarge;
                    }
                    return texttheme.headlineLarge;
                  }), backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return SolidColors.PrimaryColor;
                    }
                    return SolidColors.ColorTitle;
                  }))),
            ),
          ],
        ),
      ),
    ));
  }
}
