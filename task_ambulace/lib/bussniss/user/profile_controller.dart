import 'package:get/get.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/app_route.dart';

class ProfileController extends GetxController {
  final users = User();

  goToLogin() {
    Get.offAllNamed(AppRout.login);
  }
}
