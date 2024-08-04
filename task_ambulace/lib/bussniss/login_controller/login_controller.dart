import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ambulace/Model/admin.dart';
import 'package:task_ambulace/Model/driver.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/app_route.dart';
import 'package:task_ambulace/presentation/components/dilog_widget.dart';

class LoginController extends GetxController {
  TextEditingController uesrname = TextEditingController();
  //this key for (Form) widget ,it's like parant to TextFormField ,
  //and i ues this key to validate the inputs from TextFormField
  GlobalKey<FormState> key = GlobalKey();
  // This widget is for login to Ambulance application.
  TextEditingController password = TextEditingController();
  //this varible to check if password cann'ot see the input or not
  bool ishidden = true;
  User user = User();
  Admin admin = Admin();
  Driver driver = Driver();
  String tilteAppBar = "Login";

  validEmail(String val) {
    if (val == "") {
      return "Can't be Null Please Enter your email!";
    } else {
      return null;
    }
  }

  validPassword(String val) {
    if (val == "") {
      return "Can't be Null Please Enter your password!";
    }
    return null;
  }

  showPassword() {
    ishidden = !ishidden;
    update();
  }

  goToSignUp() {
    Get.toNamed(AppRout.signup);
  }

  login(BuildContext context) {
    if (key.currentState!.validate()) {
      if ((user.getuserslist.first["email"] == uesrname.text) &&
          (user.getuserslist.first["password"] == password.text)) {
        Get.offNamed(AppRout.homeUser);
      } else if ((admin.getuserslist.first["email"] == uesrname.text) &&
          (admin.getuserslist.first["password"] == password.text)) {
        Get.offNamed(AppRout.homeAdmin);
      } else if ((driver.getuserslist.first["email"] == uesrname.text) &&
          (driver.getuserslist.first["password"] == password.text)) {
        Get.offNamed(AppRout.homeDriver);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return ShowCusotmDilog(
              str: "the username or password is wrong",
              width: MediaQuery.of(context).size.width,
              onTapConfirm: () {
                Navigator.of(context).pop();
              },
              onTapclose: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      }
    }
  }

  @override
  void onInit() {
    key = GlobalKey();
    super.onInit();
  }
}
