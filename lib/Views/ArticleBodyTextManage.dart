// ignore_for_file: unnecessary_import, unused_import, duplicate_import, must_be_immutable, file_names

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:techblog/Views/ArticleManagement.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html_editor_enhanced/utils/callbacks.dart';
import 'package:html_editor_enhanced/utils/file_upload_model.dart';
import 'package:html_editor_enhanced/utils/options.dart';
import 'package:html_editor_enhanced/utils/plugins.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_fake.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';

import '../Components/MyColors.dart';
import '../Controller/ArticleManagement_Controller.dart';

class ArticleBodyTextManage extends StatelessWidget {
  ArticleBodyTextManage({super.key});

  final HtmlEditorController controller = Get.put(HtmlEditorController());
  var articlemanagementController = Get.put(ArticlemanagementController());

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 7),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                Text(
                  "ویرایش بدنه ی مقاله",
                  style: texttheme.displayMedium,
                )
              ],
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: SolidColors.PrimaryColor.withAlpha(150),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  shouldEnsureVisible: true,
                  hint: "اینجا میتونی مقاله تو بنویسی...",
                  initialText:
                      articlemanagementController.articleinfo.value.content!,
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    articlemanagementController.articleinfo.update((val) {
                      val?.content = p0;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
