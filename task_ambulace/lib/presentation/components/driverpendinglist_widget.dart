import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';

class PendingDriverlist extends StatelessWidget {
  const PendingDriverlist({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.recordlist,
    this.onTap,
    this.color,
  });
  final String title;
  final void Function()? onTap;

  final double width;
  final double height;
  final Color? color;
  final List recordlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recordlist.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: white_2,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 30, vertical: width / 10),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 8,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 2,
                          child: Txt(
                            str:
                                "Name:${recordlist[index]["email"]}\nPhone:${recordlist[index]["numberphone"]}\nAddress:${recordlist[index]["address"]}\nType:${recordlist[index]["type"]}\nData:${recordlist[index]["datetime"]}\nQuantity:${recordlist[index]["quantity"]}",
                            size: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Positioned(
                            top: 7,
                            height: 32,
                            width: 129,
                            right: 0,
                            child: InkWell(
                              onTap: onTap,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Txt(
                                  str: title,
                                  color: white,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
