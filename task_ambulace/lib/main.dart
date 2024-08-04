
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_ambulace/Model/admin.dart';
import 'package:task_ambulace/Model/driver.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/auth/login.dart';
import 'package:task_ambulace/route.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => User(),
    ),
    ChangeNotifierProvider(
      create: (context) => Admin(),
    ),
    ChangeNotifierProvider(
      create: (context) => Driver(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of Ambulance application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      title: 'Ambulance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: white,
          ),
          scaffoldBackgroundColor: white),
      home: const Login(),
      getPages: routes,

    );
  }
}
