import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_ambulace/app_route.dart';
import 'package:task_ambulace/presentation/admin/homeadminpage.dart';
import 'package:task_ambulace/presentation/auth/login.dart';
import 'package:task_ambulace/presentation/auth/signup.dart';
import 'package:task_ambulace/presentation/driver/homedriverpage.dart';
import 'package:task_ambulace/presentation/uesrs/bookcase.dart';
import 'package:task_ambulace/presentation/uesrs/home_user.dart';
import 'package:task_ambulace/presentation/uesrs/profile_user.dart';
import 'package:task_ambulace/presentation/uesrs/record.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRout.login, page: () => const Login()),
  GetPage(name: AppRout.signup, page: () => const SignUp()),
  GetPage(name: AppRout.recordeList, page: () => const RecordList()),
  GetPage(name: AppRout.homeAdmin, page: () => const Homeadmin()),
  GetPage(name: AppRout.homeAdmin, page: () => const Homedriver()),
  GetPage(name: AppRout.homeUser, page: () => const Home()),
  GetPage(name: AppRout.profile, page: () => const Profile()),
  GetPage(name: AppRout.bookCase, page: () => const BookCace()),
  GetPage(name: AppRout.homeDriver, page: () => const Homedriver()),
];
