
import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';

class Txtrich extends StatelessWidget {
  // this widget is customs Text.rich , it tackes the part1 and part2 as string  like data of tow widget 'TextSpan',
  //the Function onTap to implement event in click on widget
  // , the width of screen
  //the defulat  fontWeight  is FontWeight.w700 becuse  the fontWeight of most text that we will ues is FontWeight.w700

  const Txtrich({
    super.key,
    required this.part1,
    required this.part2,
    required this.onTap,
    required this.width,
  });
  final String part1;
  final String part2;
  final void Function() onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: width / 30),
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: part1,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  color: black,
                  fontWeight: FontWeight.w700)),
          TextSpan(
              text: part2,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  color: blue,
                  fontWeight: FontWeight.w700)),
        ])),
      ),
    );
  }
}
