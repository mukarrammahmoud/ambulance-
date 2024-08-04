import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ambulace/app_route.dart';
import 'package:task_ambulace/bussniss/driver/home_driver_controller.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/auth/login.dart';
import 'package:task_ambulace/presentation/components/completeddriverlist_widget.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/driverpendinglist_widget.dart';
import 'package:task_ambulace/presentation/components/image.dart';

class Homedriver extends StatelessWidget {
  const Homedriver({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<HomeDriverController>(
        init: HomeDriverController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: Size(width / 8, width / 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 15),
                          child: Txt(
                            str: controller.titleAppBar,
                            size: 32,
                          ),
                        ),
                        Images(
                            height: 254.32,
                            width: 267,
                            path: "asset/img/1719557186413.png"),
                      ],
                    )),
              ),
              body: ListView(
                  padding: EdgeInsets.symmetric(horizontal: width / 15),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Txt(
                          str: "PENDING",
                          size: 28,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: Icona(
                            icon: Icons.logout_sharp,
                            color: black,
                            size: width / 10,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 1.82,
                      child: CompletedDriverlist(
                        width: width,
                        height: height,
                        recordlist: controller.driver.getpedinglist,
                        title: "PENDING",
                        color: yellow,
                        onTap: () {},
                        onTapCancel: () {},
                        onTapContinu: () {
                          Get.offAllNamed(AppRout.login);
                        },
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: grey,
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Txt(
                      str: "COMPLETED",
                      size: 28,
                    ),
                    SizedBox(
                      height: height / 4,
                      child: PendingDriverlist(
                        width: width,
                        height: height,
                        recordlist: controller.driver.getcompletedlist,
                        title: "COMPLETED",
                        color: green,
                        onTap: () {},
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: grey,
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Txt(
                      str: "CANCELED",
                      size: 28,
                    ),
                    SizedBox(
                      height: height / 4,
                      child: PendingDriverlist(
                        width: width,
                        height: height,
                        recordlist: controller.driver.getcanceledlist,
                        title: "CANCELED",
                        color: red_1,
                        onTap: () {},
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: grey,
                    ),
                  ]));
        });
  }
}
