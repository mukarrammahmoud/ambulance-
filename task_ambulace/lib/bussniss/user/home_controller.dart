import 'package:get/get.dart';
import 'package:task_ambulace/app_route.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  List imagesgroupe = [
    {"path": "asset/img/medical.jpg", "type": "Medical"},
    {"path": "asset/img/Accident.jpg", "type": "Accident"},
    {"path": "asset/img/fire.jpg", "type": "Fire"},
    {"path": "asset/img/other.jpg", "type": "Other"}
  ];

  onClickCall() async {
    await launchUrl(Uri(scheme: 'tel', path: "1122"));
  }

  goToMtRecorde() {
    Get.toNamed(AppRout.recordeList);
  }

  goToProfile() {
    Get.toNamed(AppRout.profile);
  }

  goToBookCase() {
    Get.toNamed(AppRout.bookCase);
  }
}
