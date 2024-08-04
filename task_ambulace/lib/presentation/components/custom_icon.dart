// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class Icona extends StatelessWidget {
  // this widget is customs Icon , it tackes the  icon like IconData,
  //the defulat color is white

  Icona(
      {super.key,
      required this.icon,
      this.color = Colors.white,
      this.size = 15});

  final IconData icon;
  Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
