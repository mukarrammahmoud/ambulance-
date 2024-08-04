import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';
import 'package:task_ambulace/Model/admin.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/app_route.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/admin/blockedpage.dart';
import 'package:task_ambulace/presentation/admin/userspage.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/image.dart';
import 'package:task_ambulace/presentation/components/itemofnew_widget.dart';

import '../components/custom_icon.dart';

class Homeadmin extends StatefulWidget {
  const Homeadmin({super.key});

  @override
  State<Homeadmin> createState() => _HomeadminState();
}

class _HomeadminState extends State<Homeadmin> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Provider.of<User>(context);
    final admin = Provider.of<Admin>(context);
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context)
        .size
        .width; //this the width of screen that ues the app
    List widget = [
      SizedBox(
        height: height,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt(
                str: "NEW",
                size: 28,
              ),
              InkWell(
                onTap: () {
                  Get.offAllNamed(AppRout.login);
                },
                child: Icona(
                  icon: Icons.logout_sharp,
                  color: black,
                  size: width / 10,
                ),
              )
            ],
          ),
          NewDriverlist(
            width: width,
            height: height,
            recordlist: admin.getnewlist,
            title: "NEW",
            color: yellow,
            onTap: () {},
            onTapCancel: () {},
            onTapContinu: () {},
          ),
        ]),
      ),
      const UsersPage(),
      const Blockedpage(),
    ];
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(width / 8, width / 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width / 15),
                  child: Txt(
                    str: "ADMIN",
                    size: 32,
                  ),
                ),
                Images(
                    height: 254.32,
                    width: 267,
                    path: "asset/img/1719557186413.png"),
              ],
            )),
      ),
      body: Padding(padding: EdgeInsets.all(width / 20), child: widget[index]),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: black,
          unselectedItemColor: black,
          unselectedLabelStyle: TextStyle(
            color: black,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icona(
                  icon: Icons.home,
                  color: red_1,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icona(
                  icon: Icons.person,
                  color: red_1,
                  size: 30,
                ),
                label: "Users"),
            BottomNavigationBarItem(
                icon: Icona(
                  icon: Icons.block,
                  color: red_1,
                  size: 30,
                ),
                label: "Bloked"),
          ]),
    );
  }
}
