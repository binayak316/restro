import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/empty_view.dart';
import 'package:restro_management_sys/features/screens/mytables/my_reserved_table_controller.dart';

import '../../../core/widgets/common/error_view.dart';

class MyReservedTables extends StatelessWidget {
  static const String routeName = "/my-reserved-tables";
  final c = Get.find<MyReservedTableController>();
  MyReservedTables({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Reserved tables"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  if (c.pageState.value == PageState.LOADING) {
                    return Center(
                      child: LinearProgressIndicator(),
                    );
                  } else if (c.pageState.value == PageState.EMPTY) {
                    return EmptyView(
                      message:
                          "Looks like there is no reserved table on your name.",
                      title: "No tables at the moment",
                      media: IconPath.empty,
                    );
                  } else if (c.pageState.value == PageState.NORMAL) {
                    return SizedBox(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // number of items in each row
                                mainAxisSpacing: 10, // spacing between rows
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.7 // spacing between columns
                                ),
                        itemCount: c.myReservedTablesList.length,
                        itemBuilder: (context, index) {
                          var table = c.myReservedTablesList[index];
                          return GestureDetector(
                            onTap: () {
                              c.unReserveTable(table.id!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 248, 193, 190),
                                  // border: Border.all(
                                  //     width: 2, color: AppColors.redColor),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    IconPath.reservedtable,
                                    height: 70,
                                    width: 70,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(table.date != null
                                      ? " Date: ${table.date}"
                                      : ""),
                                  Text(table.time != null
                                      ? " Time: ${table.time}"
                                      : ""),
                                  Text(table.guestCount != null
                                      ? "No of guests: ${table.guestCount}"
                                      : ""),
                                  Text(table.user?.name != null
                                      ? "Booked By: ${table.user?.name}"
                                      : ""),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return ErrorView(
                      message: "Might be internal server error",
                      title: "Something went wrong",
                      media: IconPath.empty,
                    );
                  }
                })
              ],
            ),
          ),
        ));
  }
}
