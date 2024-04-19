import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/empty_view.dart';
import 'package:restro_management_sys/core/widgets/common/error_view.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';

class TableBookingScreen extends StatelessWidget {
  static const String routeName = "/table-booking-screen";
  final c = Get.find<TableController>();
  TableBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reserve Available Table"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                if (c.pageState.value == PageState.LOADING) {
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                } else if (c.pageState.value == PageState.EMPTY) {
                  return EmptyView(
                    media: IconPath.empty,
                    message: "No data at the moment",
                    title: "Data not available",
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // number of items in each row
                              mainAxisSpacing: 10, // spacing between rows
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.8 // spacing between columns
                              ),
                      itemCount: c.tableList.length,
                      itemBuilder: (context, index) {
                        var table = c.tableList[index];
                        return GestureDetector(
                          onTap: () {
                            if (table.status != 0) {
                              SkySnackBar.error(
                                  title: "Table Booking",
                                  message:
                                      "${table.name} has been already reserved.");
                            } else {
                              c.table.value = table;
                              DatePickerBdaya.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2050, 12, 12),
                                onChanged: (date) {
                                  print('change $date');
                                  c.pickedDate.value = date.toString();
                                  c.splitDateTime(date);
                                },
                                onConfirm: (date) {
                                  print('confirm $date');
                                  c.guestNumber.value = 1;
                                  c.splitDateTime(date);

                                  c.openReservationBottomSheet(table);
                                  // Here you can handle the selected date and time
                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   width: 2,
                              //   color: table.status == 0
                              //       ? AppColors.green
                              //       : AppColors.redColor,
                              // ),
                              borderRadius: BorderRadius.circular(8),
                              color: table.status == 0
                                  ? AppColors.green
                                  : Color.fromARGB(255, 248, 193, 190),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  IconPath.upcoming,
                                  height: 70,
                                  width: 70,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(table.name ?? "Table A"),
                                if (table.reservation != null)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (table.reservation?.date != null)
                                        Text(
                                            "Date: ${table.reservation?.date.toString()}"),
                                      if (table.reservation?.time != null)
                                        Text(
                                            "Time: ${table.reservation?.time.toString()}"),
                                      if (table.reservation != null)
                                        Text(
                                            "No. of Guests: ${table.reservation?.guestCount.toString()}")
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return ErrorView(
                    media: IconPath.error,
                    message: "Something went wrong",
                    title: "Internal Server Error",
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
