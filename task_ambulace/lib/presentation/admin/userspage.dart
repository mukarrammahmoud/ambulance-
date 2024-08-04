import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_ambulace/Model/user.dart';
import 'package:task_ambulace/constant.dart';

import '../components/userslist_widget.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context).size.width;
    final users = Provider.of<User>(context);
    //this the width of screen that ues the app
    return Userslist(
      width: width,
      height: height,
      recordlist: users.getuserslist,
      onTap: () {},
      title: "Active",
      color: green,
      titleofbotton: "BlOCK",
      onTapblock: () {},
    );
  }
}
