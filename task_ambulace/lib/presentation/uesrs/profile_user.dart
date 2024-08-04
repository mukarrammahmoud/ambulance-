import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ambulace/bussniss/user/profile_controller.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/image.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icona(
            icon: Icons.arrow_back_sharp,
            color: black,
            size: width / 12,
          ),
        ),
      ),
      body: GetBuilder<ProfileController>(builder: (controller) {
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width / 40),
              child: Column(
                children: [
                  Container(
                    width: width / 1,
                    height: height / 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pink,
                    ),
                    child: Icona(
                      icon: Icons.person,
                      size: width / 5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: width / 20,
                    ),
                    child: Txt(
                      str: controller.users.getuserslist.first["fullname"],
                      size: 32,
                    ),
                  ),
                  Txt(
                    str: controller.users.getuserslist.first["cnic"].toString(),
                    size: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  Txt(
                    str: controller.users.getuserslist.first["numberphone"],
                    size: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  Txt(
                    str: controller.users.getuserslist.first["email"],
                    size: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  Txt(
                    str: controller.users.getuserslist.first["address"],
                    size: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height / 20,
                    ),
                    child: Txt(
                      str: "YOUR CNIC",
                      size: 32,
                    ),
                  ),
                  // Container(
                  //   // padding: EdgeInsets.symmetric(vertical: height / 50),
                  //   height: height / 2.7,
                  //   child: Image.file(
                  //     File(users.getuserslist.first["imgCNIC"]),
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  SizedBox(
                      height: height / 6,
                      child: Images(
                          height: height,
                          width: width,
                          path: r"asset/img/1719329254389.png")),
                  SizedBox(
                    height: height / 8,
                  ),
                  Buttontxt(
                    title: Txt(
                      str: "LOGOUT",
                      color: white,
                      size: 26,
                      textAlign: TextAlign.center,
                    ),
                    width: width,
                    onTap: () {
                      controller.goToLogin();
                    },
                    leading: Icona(
                      icon: Icons.logout,
                      size: width / 12,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: width / 16),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
