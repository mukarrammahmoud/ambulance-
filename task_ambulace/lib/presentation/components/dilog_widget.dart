import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';

class ShowCusotmDilog extends StatelessWidget {
  const ShowCusotmDilog(
      {super.key,
      required this.str,
      required this.width,
      required this.onTapConfirm,
      required this.onTapclose});
  final String str;
  final double width;
  final void Function() onTapConfirm;
  final void Function() onTapclose;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Txt(
        str: "Alert",
        size: 24,
        textAlign: TextAlign.center,
      ),
      content: Txt(
        str: str,
        size: 15,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
      actions: [
        InkWell(
          onTap: onTapclose,
          child: Txt(
            str: "Close",
            color: purple,
            size: 21,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: onTapConfirm,
          child: Txt(
            str: "Confirm",
            color: purple,
            size: 21,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
      elevation: 2,
      contentPadding:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: width / 20),
      actionsAlignment: MainAxisAlignment.spaceAround,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: black, width: 1),
          borderRadius: BorderRadius.circular(
            15,
          )),
      backgroundColor: white,
    );
  }
}
