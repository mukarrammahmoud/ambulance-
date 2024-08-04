// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
// this widget fot textformfield and his style it take TextEditingController , hintText ,
// icon from custom type , the width of screen , keyboardType to customize the textformfield ,
// obscureText to check if the filed is for password input and the widget of iconapassword,

class TxtField extends StatelessWidget {
  TxtField(
      {super.key,
      required this.icon,
      required this.width,
      required this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText = false,
      this.iconapass,
      this.validator});
  TextEditingController? controller;
  final String hintText;
  final Icona icon;
  final double width;
  TextInputType? keyboardType;
  bool obscureText;
  Widget? iconapass;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width / 16, vertical: width / 60),
      child: TextFormField(
        cursorRadius: const Radius.circular(10),
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: red_1,
          filled: true,
          suffixIcon: iconapass,
          suffixIconConstraints:
              // this condition for check if the filed doesn't has iconapassword ,
              //it doesn't take space from filed
              iconapass != null ? BoxConstraints(minWidth: width / 6) : null,
          prefixIcon: icon,
          prefixIconConstraints: BoxConstraints(minWidth: width / 6),
          hintText: hintText,
          hintStyle: TextStyle(
            color: white,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
            fontSize: 18,
          ),
          contentPadding: EdgeInsets.all(width / 22),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          errorStyle: const TextStyle(
              color: Colors.redAccent,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
