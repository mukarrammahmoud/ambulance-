// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/app_route.dart';
import 'package:task_ambulace/presentation/components/dilog_widget.dart';

class BookCaseController extends GetxController {
  bool isselectedMinor = false;
  File? imagefiles;
  final users = User();
  bool isselectedMajor = false;
  String? quantity;
  String titleAppBar = "BOOK AN \nAMBULANNCE";
  changeSwithTitleMajor(bool value) {
    isselectedMinor == true
        ? {isselectedMinor = false, isselectedMajor = value}
        : isselectedMajor = value;
    quantity = "Major";
    update();
  }

  changeSwithTitleMinor(bool value) {
    isselectedMajor == true
        ? {isselectedMajor = false, isselectedMinor = value}
        : isselectedMinor = value;
    quantity = "Minor";
    update();
  }

  Future get_image_for_Photo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photocamara =
        await picker.pickImage(source: ImageSource.camera);
    imagefiles = File(photocamara!.path);
    users.setisuplod = true;
    update();
  }

  onTapBookCase(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return ShowCusotmDilog(
          str: "Are you sure to book this case?",
          width: width,
          onTapConfirm: () {
            Get.toNamed(AppRout.homeUser);
          },
          onTapclose: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
