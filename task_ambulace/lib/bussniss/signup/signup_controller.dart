// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/app_route.dart';

class SignUpController extends GetxController {
  final String titleAppBar = "SIGNUP";
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController districts = TextEditingController();

  bool isshow = true;
  List<String> provinces = [];
  File? imagefile;
  final users = User();
  changeStatePassword() {
    isshow = !isshow;
    update();
  }

  Future get_image_for_Photo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photocamara =
        await picker.pickImage(source: ImageSource.camera);

    imagefile = File(photocamara!.path);
  }

  Future get_image_form_gallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photocamara =
        await picker.pickImage(source: ImageSource.gallery);
    imagefile = File(photocamara!.path);
  }

  signUp() {
    if (key.currentState!.validate()) {
      users.adduser(
          email.text,
          int.tryParse(cnic.text)!,
          fullname.text,
          phonenumber.text,
          "Fire",
          password.text,
          "quantity",
          address.text,
          districts.text,
          (imagefile!),
          imagefile!,
          DateTime.now());
      Get.toNamed(AppRout.homeUser);
    }
  }
}
