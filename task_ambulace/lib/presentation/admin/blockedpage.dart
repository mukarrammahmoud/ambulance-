import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_ambulace/Model/admin.dart';
import 'package:task_ambulace/bussniss/admin/blocked_page_controller.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/userslist_widget.dart';

class Blockedpage extends StatelessWidget {
  const Blockedpage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BlockPageController());
    final admin = Provider.of<Admin>(context);

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return GetBuilder<BlockPageController>(builder: (controller) {
      return Userslist(
        width: width,
        height: height,
        recordlist: admin.getnewlist,
        onTap: () {
          controller.onTapBlock();
        },
        title: controller.tilteBlock,
        color: red_1,
        titleofbotton: controller.tilteUnBlock,
        onTapblock: () {
          controller.onTapUnBlock();
        },
      );
    });
  }
}
