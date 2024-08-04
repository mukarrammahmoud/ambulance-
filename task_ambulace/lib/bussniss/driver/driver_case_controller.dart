import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ambulace/app_route.dart';
import 'package:task_ambulace/presentation/components/dilog_widget.dart';

class DriverCaseController extends GetxController {
  final String titleAppBar = "BOOK AN \nAMBULANNCE";

  showDialogOnTap(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return ShowCusotmDilog(
          str: "Do you want to Complete the Case?",
          width: width,
          onTapConfirm: () {
            Get.toNamed(AppRout.homeDriver);
          },
          onTapclose: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
