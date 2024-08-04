import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/bussniss/login_controller/login_controller.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/custom_text_field.dart';
import 'package:task_ambulace/presentation/components/custom_text_reach.dart';
import 'package:task_ambulace/presentation/components/image.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // //this  Controller for the email input
  @override
  Widget build(BuildContext context) {
    // final users = Provider.of<User>(context);
    // final admins = Provider.of<Admin>(context);
    // final driver = Provider.of<Driver>(context);

    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app

    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Txt(
                str: controller.tilteAppBar,
                size: 26,
              ),
              centerTitle: true,
            ),
            body: Form(
              key: controller.key,
              child: ListView(
                children: [
                  Images(
                      path: r"asset/img/1719329254389.png",
                      height: height,
                      width: width),
                  TxtField(
                      controller: controller.uesrname,
                      icon: Icona(
                        icon: Icons.email_outlined,
                        size: width / 12,
                      ),
                      width: width,
                      hintText: "Enter your email",
                      validator: (val) {
                        return controller.validEmail(val!);
                      }),
                  TxtField(
                    controller: controller.password,
                    icon: Icona(
                      icon: Icons.password_outlined,
                      size: width / 12,
                    ),
                    width: width,
                    hintText: "Password",
                    iconapass: InkWell(
                      onTap: () {
                        controller.showPassword();
                      },
                      child: Icona(
                          icon: controller.ishidden
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          size: width / 12),
                    ),
                    obscureText: controller.ishidden,
                    validator: (val) {
                      return controller.validPassword(val!);
                    },
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(
                          horizontal: width / 16, vertical: width / 15),
                      child: InkWell(
                          onTap: () {},
                          child: Txt(
                            str: "Forgot Password?",
                          ))),
                  Buttontxt(
                    title: Txt(
                      str: "LOGIN",
                      size: 26,
                      color: white,
                      textAlign: TextAlign.center,
                    ),
                    width: width,
                    onTap: () {
                      controller.login(context);
                    },
                    padding: EdgeInsets.symmetric(horizontal: width / 16),
                  ),
                  Txtrich(
                    part1: "Don't hava an account?",
                    part2: "SignUP",
                    onTap: () => controller.goToSignUp(),
                    width: width,
                  ),
                  SizedBox(
                    height: width / 5,
                  )
                ],
              ),
            ),
          );
        });
  }
}
