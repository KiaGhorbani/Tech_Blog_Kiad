// ignore_for_file: deprecated_member_use, curly_braces_in_flow_control_structures, unused_local_variable, prefer_const_constructors, sort_child_properties_last, file_names, body_might_complete_normally_nullable, unused_import, prefer_interpolation_to_compose_strings, avoid_print, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/MyColors.dart';
import 'package:techblog/Components/MyStrings.dart';
import 'package:techblog/Controller/Registerpage_Controller.dart';
import 'package:techblog/Views/ChooseCategories.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:validators/validators.dart';

class RegisterpageIntro extends StatelessWidget {
  var registerpageController = Get.find<RegisterpageController>();
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
                  onPressed: () {
                    //BottomSheet Enter Email
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                                height: size.height / 2.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    )),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //Please Enter Email
                                      Text(
                                        Strings.EnterEmail,
                                        style: texttheme.titleLarge,
                                      ),
                                      //Enter Email
                                      Padding(
                                        padding: const EdgeInsets.all(32),
                                        child: TextField(
                                          controller: registerpageController
                                              .EmailTextEditingController,
                                          onChanged: (value) {
                                            print("Email is " +
                                                isEmail(value).toString());
                                          },
                                          textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: "Techblog@gmail.com",
                                              hintStyle: texttheme.bodyMedium),
                                        ),
                                      ),
                                      //Proceed
                                      ElevatedButton(
                                          onPressed: () async {
                                            registerpageController.Register();
                                            Navigator.pop(context);
                                            //Activation code bottomsheet
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: Container(
                                                        height:
                                                            size.height / 2.5,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          16),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          16),
                                                                )),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              //Please Enter The Code
                                                              Text(
                                                                Strings
                                                                    .EnterCode,
                                                                style: texttheme
                                                                    .titleLarge,
                                                              ),
                                                              //Enter Code
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        32),
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      registerpageController
                                                                          .VerifyCodetextEditingController,
                                                                  onChanged:
                                                                      (value) {
                                                                    print("Email is " +
                                                                        isEmail(value)
                                                                            .toString());
                                                                  },
                                                                  //style: texttheme.bodyMedium,
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  decoration: InputDecoration(
                                                                      hintText:
                                                                          "******",
                                                                      hintStyle:
                                                                          texttheme
                                                                              .bodyMedium),
                                                                ),
                                                              ),
                                                              //Proceed
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    registerpageController
                                                                        .Verify();
                                                                  },
                                                                  child: Text(
                                                                      "ادامه"))
                                                            ],
                                                          ),
                                                        )),
                                                  );
                                                });
                                          },
                                          child: Text("ادامه"))
                                    ],
                                  ),
                                )),
                          );
                        });
                  },
                  child: Text(
                    "بزن بریم",
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
