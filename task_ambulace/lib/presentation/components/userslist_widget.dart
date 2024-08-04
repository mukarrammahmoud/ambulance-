import 'package:flutter/material.dart';
import 'package:task_ambulace/constant.dart';
import 'package:task_ambulace/presentation/components/costom_button.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/custom_icon.dart';
import 'package:task_ambulace/presentation/components/image.dart';

class Userslist extends StatelessWidget {
  const Userslist({
    super.key,
    required this.width,
    required this.height,
    required this.recordlist,
    this.onTap,
    this.color,
    required this.title,
    required this.onTapblock,
    required this.titleofbotton,
  });
  final void Function()? onTap;
  final String title;
  final String titleofbotton;
  final void Function() onTapblock;

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
                  horizontal: width / 20, vertical: width / 20),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 6,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 1,
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
                        Positioned(
                          left: 2,
                          child: Txt(
                            str:
                                "Name:${recordlist[index]["email"]}\nPhone:${recordlist[index]["numberphone"]}\nAddress:${recordlist[index]["address"]}\nType:${recordlist[index]["type"]}\nData:${recordlist[index]["datetime"]}",
                            size: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
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
                  Buttontxt(
                      leading: Icona(
                        icon: Icons.arrow_right_alt_sharp,
                        size: width / 14,
                      ),
                      title: Txt(
                        str: titleofbotton,
                        color: white,
                        size: 20,
                        textAlign: TextAlign.center,
                      ),
                      padding: const EdgeInsets.all(0),
                      width: width,
                      onTap: onTapblock)
                ],
              )),
        );
      },
    );
  }
}
