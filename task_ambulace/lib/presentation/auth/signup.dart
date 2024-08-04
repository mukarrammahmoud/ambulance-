// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/bussniss/signup/signup_controller.dart';
import 'package:task_ambulace/presentation/auth/login.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/custom_text_field.dart';
import 'package:task_ambulace/presentation/components/custom_text_reach.dart';
import 'package:task_ambulace/presentation/components/image.dart';
import 'package:task_ambulace/presentation/components/text_phone_field.dart';
// import 'package:intl_phone_field/countries.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpController());
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    return Scaffold(
      body: GetBuilder<SignUpController>(
          init: SignUpController(),
          builder: (controller) {
            return SafeArea(
              child: Form(
                key: controller.key,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: height / 30),
                  children: [
                    Center(
                      child: Txt(
                        str: controller.titleAppBar,
                        size: 26,
                      ),
                    ),
                    Images(
                      height: height,
                      width: width,
                      path: r"asset/img/1719329254210.png",
                    ),
                    TxtField(
                      controller: controller.email,
                      icon: Icona(
                        icon: Icons.email_outlined,
                        size: width / 12,
                      ),
                      width: width,
                      hintText: "Enter your email",
                      validator: (val) {
                        if (val == "") {
                          return "Can't be Null Please Enter your email!";
                        }
                        return null;
                      },
                    ),
                    TxtField(
                      controller: controller.cnic,
                      icon: Icona(
                        icon: Icons.credit_card,
                        size: width / 12,
                      ),
                      width: width,
                      hintText: "CNIC number",
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == "") {
                          return "Can't be Null Please Enter your CNIC number!";
                        }
                        return null;
                      },
                    ),
                    TxtField(
                      controller: controller.fullname,
                      icon: Icona(
                        icon: Icons.person,
                        size: width / 12,
                      ),
                      width: width,
                      hintText: "Full Name",
                      validator: (val) {
                        if (val == "") {
                          return "Can't be Null Please Enter your Name!";
                        }
                        return null;
                      },
                    ),
                    PhoneField(
                      width: width,
                      phonenumber: controller.phonenumber,
                      validator: (val) async {
                        if (val == null) {
                          return "Can't be Null Please Enter your CNIC number!";
                        }
                        return null;
                      },
                    ),
                    TxtField(
                      controller: controller.password,
                      hintText: "Password",
                      obscureText: controller.isshow,
                      icon: Icona(
                        icon: Icons.password_rounded,
                        size: width / 12,
                      ),
                      iconapass: InkWell(
                        onTap: () {
                          controller.changeStatePassword();
                        },
                        child: Icona(
                            icon: controller.isshow
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                            size: width / 12),
                      ),
                      validator: (val) {
                        if (val == "") {
                          return "Can't be Null Please the password!";
                        }
                        return null;
                      },
                      width: width,
                    ),
                    InkWell(
                      onTap: () {},
                      child: TxtField(
                          controller: controller.address,
                          icon: Icona(
                            icon: Icons.location_pin,
                            size: width / 9,
                          ),
                          width: width,
                          hintText: "Address",
                          keyboardType: TextInputType.streetAddress,
                          validator: (val) {
                            if (val == "") {
                              return "Can't be Null Please Enter your Address!";
                            }
                            return null;
                          }),
                    ),
                    TxtField(
                        controller: controller.districts,
                        icon: Icona(
                          icon: Icons.list,
                          size: width / 12,
                        ),
                        width: width,
                        iconapass: Icona(
                          icon: Icons.navigate_next,
                          size: width / 12,
                        ),
                        hintText: "select your Districts",
                        keyboardType: TextInputType.streetAddress,
                        validator: (val) {
                          if (val == "") {
                            return "Can't be Null Please Enter your Districts!";
                          }
                          return null;
                        }),
                    controller.imagefile == null
                        ? InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Txt(
                                        str: "Pleaes tack picture to CNIC",
                                        color: white,
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () async {
                                            await controller
                                                .get_image_for_Photo();
                                          },
                                          child: Icona(
                                            icon: Icons.camera_alt,
                                            size: width / 10,
                                            color: white,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await controller
                                                .get_image_form_gallery();
                                          },
                                          child: Icona(
                                            icon: Icons.photo,
                                            size: width / 10,
                                            color: white,
                                          ),
                                        ),
                                      ],
                                      actionsPadding:
                                          EdgeInsets.all(width / 20),
                                      actionsAlignment:
                                          MainAxisAlignment.spaceAround,
                                      titlePadding: EdgeInsets.all(width / 20),
                                      backgroundColor: red_1,
                                    );
                                  });
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 16),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Images(
                                      height: height,
                                      width: width,
                                      path: r"asset/img/Ci.jpg"),
                                  Container(
                                    width: width,
                                    height: width / 6.7,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width / 22,
                                        vertical: width / 60),
                                    decoration: BoxDecoration(
                                        color: red_1,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Txt(
                                        str: "Upload your Personal CNIC",
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(vertical: height / 50),
                            height: height / 2.89,
                            child: Image.file(
                              controller.imagefile!,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                    Buttontxt(
                      title: Txt(
                        str: "SIGNUP",
                        size: 26,
                        color: white,
                        textAlign: TextAlign.center,
                      ),
                      width: width,
                      onTap: () {
                        controller.signUp();
                      },
                      padding: EdgeInsets.symmetric(horizontal: width / 16),
                    ),
                    Txtrich(
                      part1: "You have already account?",
                      part2: "Login",
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const Login())),
                      width: width,
                    ),
                    // SizedBox(
                    //   height: width / 5,
                    // )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Future<Map<String, dynamic>> getCountriesBySubRegion() async {
  const String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
  const String url =
      'https://countrystats-api.p.rapidapi.com/getCountriesBySubRegion?sub_region=Western%20Europe';

  final headers = {
    'x-rapidapi-key': apiKey,
    'x-rapidapi-host': 'countrystats-api.p.rapidapi.com',
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to get countries: ${response.statusCode}');
  }
}
