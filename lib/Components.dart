// ignore_for_file: file_names, unnecessary_import, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/Models/fakedata.dart';
import 'package:techblog/gen/assets.gen.dart';

import 'MyColors.dart';

class ProjectDivider extends StatelessWidget {
  const ProjectDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: SolidColors.DividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class Hashtags extends StatelessWidget {
  Hashtags({
    super.key,
    required this.texttheme,
    required this.index,
  });

  final TextTheme texttheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
              colors: GradientColors.HashtagsColor,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(Hashtaglist[index].Title, style: texttheme.headlineMedium)
          ],
        ),
      ),
    );
  }
}
