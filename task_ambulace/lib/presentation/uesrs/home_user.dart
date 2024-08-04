// ignore_for_file: prefer_const_constructors, file_names

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/bussniss/user/home_controller.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/image.dart';
// ignore: implementation_imports
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    final users = Provider.of<User>(context);

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app

    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size(width / 8, width / 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 15),
                    child: Txt(
                      str: "BOOK AN \nAMBULANNCE",
                      size: 32,
                    ),
                  ),
                  Expanded(
                    child: Images(
                        height: 254.32,
                        width: 288,
                        path: "asset/img/1719557186413.png"),
                  ),
                ],
              )),
        ),
        body: ListView(
          padding: EdgeInsets.all(width / 30),
          children: [
            Container(
              height: height / 2.1,
              margin: EdgeInsets.symmetric(vertical: width / 20),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.imagesgroupe.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: width / 20,
                  crossAxisSpacing: width / 18,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.goToBookCase();
                    },
                    child: Container(
                      padding: EdgeInsets.all(width / 100),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: red_1, width: 1)),
                      child: Images(
                        height: height / 43,
                        width: width,
                        path: controller.imagesgroupe[index]["path"],
                      ),
                    ),
                  );
                },
              ),
            ),
            Buttontxt(
              title: Txt(
                str: "1122 Call",
                size: 26,
                color: white,
                textAlign: TextAlign.center,
              ),
              width: width,
              onTap: () async {
                controller.onClickCall();
              },
              padding: EdgeInsets.symmetric(horizontal: 0),
            ),
            SizedBox(
              height: width / 3,
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -10,
                        right: 10,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: green,
                              border: Border.all(color: white, width: 1)),
                          child: Txt(
                            str: users.getpedinglist.length.toString(),
                            size: 20,
                            textAlign: TextAlign.center,
                            color: white,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Buttontxt(
                          title: Txt(
                            str: "MY RECORD",
                            size: 20,
                            color: white,
                          ),
                          leading: Icona(
                            icon: Icons.document_scanner_outlined,
                            size: width / 14,
                          ),
                          onTap: () async {
                            controller.goToMtRecorde();
                          },
                          width: width,
                          padding: EdgeInsets.symmetric(horizontal: width / 80),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Buttontxt(
                    title: Txt(
                      str: "PROFILE",
                      size: 20,
                      color: white,
                      textAlign: TextAlign.center,
                    ),
                    leading: Icona(
                      icon: Icons.person,
                      size: width / 14,
                    ),
                    onTap: () async {
                      controller.goToProfile();
                    },
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width / 80),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
