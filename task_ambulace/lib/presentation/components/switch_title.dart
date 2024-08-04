// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';

class SwitchTile extends StatelessWidget {
  SwitchTile({
    super.key,
    required this.widget,
    required this.width,
    required this.onChanged,
    required this.isselected,
  });
  final Widget widget;
  final double width;
  bool isselected;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: width / 2.23,
        padding: EdgeInsets.symmetric(horizontal: width / 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget,
            Switch(
                activeTrackColor: black,
                inactiveTrackColor: white_2,
                inactiveThumbColor: white,
                value: isselected,
                onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
