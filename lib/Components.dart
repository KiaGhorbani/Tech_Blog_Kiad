// ignore_for_file: file_names, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
