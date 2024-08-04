import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:task_ambulace/bussniss/user/record_controller.dart';
import 'package:task_ambulace/presentation/components/custom_text.dart';
import 'package:task_ambulace/presentation/components/image.dart';

import '../../constant.dart';

class RecordList extends StatelessWidget {
  const RecordList({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context)
        .size
        .height; //this the height of screen that ues the app
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<RecordController>(
        init: RecordController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: Size(width / 8, width / 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 15),
                          child: Txt(
                            str: controller.titleAppBar,
                            size: 32,
                          ),
                        ),
                        Expanded(
                          child: Images(
                              height: 254.32,
                              width: 288,
                              path: "asset/img/1719557186413.png"),
                        ),
                      ],
                    )),
              ),
              body: ListView(
                padding: EdgeInsets.all(width / 15),
                children: [
                  SizedBox(
                    height: height / 4.5,
                    child: ItemofRecord(
                      width: width,
                      height: height,
                      recordlist: controller.users.getpedinglist,
                      title: "PENDING",
                      color: yellow,
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    color: grey,
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  SizedBox(
                    height: height / 4.5,
                    child: ItemofRecord(
                      width: width,
                      height: height,
                      recordlist: controller.users.getcompletedlist,
                      title: "COMPLETED",
                      color: green,
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    color: grey,
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  SizedBox(
                    height: height / 4.5,
                    child: ItemofRecord(
                      width: width,
                      height: height,
                      recordlist: controller.users.getcanceledlist,
                      title: "CANCELED",
                      color: red_1,
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    color: grey,
                  ),
                ],
              ));
        });
  }
}

class ItemofRecord extends StatelessWidget {
  const ItemofRecord({
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
    return ListView(
      children: [
        Txt(
          str: title,
          size: 28,
        ),
        SizedBox(
          height: height / 5.5,
          child: ListView.builder(
            itemCount: recordlist.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: white_2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 28, vertical: width / 20),
                  child: Stack(
                    children: [
                      Positioned(
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
              );
            },
          ),
        ),
      ],
    );
  }
}
