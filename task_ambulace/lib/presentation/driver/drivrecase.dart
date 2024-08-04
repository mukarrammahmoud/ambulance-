// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ambulace/bussniss/driver/driver_case_controller.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/map.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/image.dart';

class DriverCase extends StatelessWidget {
  const DriverCase({
    super.key,
  });
  // final Completer<GoogleMapController> _controller =
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => DriverCaseController(),
    );
    //  Get.lazyPut(() => ProfileController());

    // Provider.of<User>(context);

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<DriverCaseController>(builder: (controller) {
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
            Container(
              height: height,
              margin: EdgeInsets.symmetric(vertical: width / 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: red_1, width: 1)),
              child: const LocationMap(),
            ),
            Buttontxt(
              title: Txt(
                str: "Complete",
                color: white,
                size: 26,
                textAlign: TextAlign.center,
              ),
              width: width,
              onTap: () {},
              leading: Icona(
                icon: Icons.check,
                size: width / 10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: width / 80,
              ),
            ),
          ],
        ),
      );
    });
  }
}
