import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/image.dart';

class NewDriverlist extends StatelessWidget {
  const NewDriverlist({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.recordlist,
    this.onTap,
    this.color,
    required this.onTapCancel,
    required this.onTapContinu,
  });
  final String title;
  final void Function()? onTap;
  final void Function() onTapCancel;
  final void Function() onTapContinu;
  final double width;
  final double height;
  final Color? color;
  final List recordlist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 1.5,
      child: ListView.builder(
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
                      height: height / 7,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 2,
                            child: Txt(
                              str:
                                  "Name:${recordlist[index]["email"]}\nPhone:${recordlist[index]["numberphone"]}\nAddress:${recordlist[index]["address"]}\nType:${recordlist[index]["type"]}\nData:${recordlist[index]["datetime"]}",
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
                    // Container( //
                    //   height: height / 6,
                    //   width: width,
                    //   child: Image.file(
                    //     File(recordlist[index]["imgCNIC"]),
                    //     fit: BoxFit.fitHeight,
                    //   ),
                    // ),
                    SizedBox(
                        height: height / 6,
                        child: Images(
                            height: height,
                            width: width,
                            path: r"asset/img/1719329254389.png")),
                    const SizedBox(
                      height: 40,
                    ),
                    // Container(
                    //     height: height / 6,
                    //     child: Image.file(
                    //       File(recordlist[index]["imgCNIC"]),
                    //       fit: BoxFit.fitHeight,
                    //     )),
                    SizedBox(
                        height: height / 6,
                        child: Images(
                            height: height,
                            width: width,
                            path: r"asset/img/1719329254389.png")),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Buttontxt(
                                leading: Icona(
                                  icon: Icons.arrow_right_alt_sharp,
                                  size: width / 10,
                                ),
                                title: Txt(
                                  str: "CONTINUE",
                                  color: white,
                                  size: 20,
                                  textAlign: TextAlign.start,
                                ),
                                padding: const EdgeInsets.all(0),
                                width: width,
                                onTap: onTapContinu)),
                        Expanded(
                            child: Buttontxt(
                                leading: Icona(
                                  icon: Icons.arrow_right_alt_sharp,
                                  size: width / 10,
                                ),
                                title: Txt(
                                  str: "CANCEL",
                                  color: white,
                                  size: 20,
                                ),
                                padding: const EdgeInsets.all(0),
                                width: width,
                                onTap: onTapCancel)),
                      ],
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
