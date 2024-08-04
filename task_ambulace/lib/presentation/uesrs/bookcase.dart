// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ambulace/bussniss/user/bookcase_controller.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/map.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/image.dart';
import 'package:task_ambulace/presentation/components/switch_title.dart';

class BookCace extends StatelessWidget {
  const BookCace({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BookCaseController());
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<BookCaseController>(builder: (controller) {
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
                      str: controller.titleAppBar,
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
          padding: EdgeInsets.all(width / 20),
          children: [
            SizedBox(
              height: height / 16,
              child: Row(
                children: [
                  SwitchTile(
                    widget: Txt(str: "Major", size: 28),
                    width: width,
                    onChanged: (value) {
                      controller.changeSwithTitleMajor(value);
                    },
                    isselected: controller.isselectedMajor,
                  ),
                  SwitchTile(
                    widget: Txt(str: "Minor", size: 28),
                    width: width,
                    onChanged: (value) {
                      controller.changeSwithTitleMinor(value);
                    },
                    isselected: controller.isselectedMinor,
                  ),
                ],
              ),
            ),
            Container(
              height: height / 1.8,
              margin: EdgeInsets.symmetric(vertical: width / 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: red_1, width: 1)),
              child: const LocationMap(),
            ),
            SizedBox(
              height: height / 8,
              width: width,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Buttontxt(
                      title: Txt(
                        str: "BOOK CASE",
                        color: white,
                        size: 26,
                      ),
                      width: width,
                      onTap: () {
                        controller.onTapBookCase(context);
                      },
                      leading: Icona(
                        icon: Icons.location_on,
                        size: width / 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 80,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: controller.users.getisuplod == false
                        ? Container(
                            height: height / 15,
                            decoration: BoxDecoration(
                                color: red_1,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: red_1, width: 1)),
                            child: InkWell(
                              onTap: () async {
                                await controller.get_image_for_Photo();
                              },
                              child: Icona(
                                icon: Icons.upload,
                                size: width / 12,
                              ),
                            ),
                          )
                        : Container(
                            height: height / 15,
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: red_1, width: 1)),
                            child: Icona(
                              icon: Icons.check,
                              size: width / 12,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  //  Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
}
