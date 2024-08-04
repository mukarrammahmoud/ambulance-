// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Txt extends StatelessWidget {


  // this widget is customs Text , it tackes the string like data,
  // the defulat size is 18 px becuse  the size of most text that we will ues is 18 px
  //the defulat color is black
  //the defulat  fontWeight  is FontWeight.w700 becuse  the fontWeight of most text that we will ues is FontWeight.w700
  Txt(
      {super.key,
      required this.str,
      this.size = 18,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w700,
      this.textAlign});
  final String str;
  double size;
  Color color;
  FontWeight fontWeight;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      textAlign: textAlign,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: "Inter",
          fontSize: size,
          color: color,
          fontWeight: fontWeight),
    );
  }
}
