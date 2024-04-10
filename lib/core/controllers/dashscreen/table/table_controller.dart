import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
import 'package:restro_management_sys/core/repo/table_repo.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/table_booking/reservation_bottom_sheet.dart';

class TableController extends GetxController {
  RxList<TableModelModel> tableList = RxList();
  RxList<TableModelModel> availableTablesList = RxList();

  Rx<PageState> pageState = PageState.LOADING.obs;
  ProgressDialog loading = ProgressDialog();
  Rxn<TableModelModel> table = Rxn();

  @override
  void onInit() {
    getAlltables();
    getAVailabletables();
    super.onInit();
  }

  void getAlltables() async {
    tableList.clear();
    await TableRepo.getTables(
      onSuccess: (tables) {
        if (tables.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          tableList.addAll(tables);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }

  void getAVailabletables() async {
    availableTablesList.clear();
    await TableRepo.getAvailableTables(
      onSuccess: (availableTables) {
        if (availableTables.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          availableTablesList.addAll(availableTables);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }

  // RxString pickedDate = RxString("${DateTime.now()}");
  RxString pickedDate = RxString("");
  RxString pickedSplittedDate = RxString("");
  RxString pickedSplittedTime = RxString("");

  void splitDateTime(DateTime dateTime) {
    String datePart =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    String timePart =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

    pickedDate.value = dateTime.toString();
    pickedSplittedDate.value = datePart;
    pickedSplittedTime.value = timePart;
  }

  RxInt guestNumber = RxInt(1);
  onIncrement() {
    if (guestNumber.value >= 1) {
      guestNumber.value += 1;
    }
  }

  onDecrement() {
    if (guestNumber.value > 1) {
      guestNumber.value -= 1;
    }
  }

  openReservationBottomSheet(TableModelModel table) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: TableReservationBottomSheet(table: table),
        );
      },
    );
  }

  // GlobalKey<FormState> tableKey = GlobalKey<FormState>();
  Future<void> onSubmit() async {
    // if (tableKey.currentState!.validate()) {
    loading.show();
    if (table.value != null) {
      await TableRepo.bookTable(
          tableId: int.parse(table.value!.id.toString()),
          date: pickedSplittedDate.value.toString(),
          time: pickedSplittedTime.value.toString(),
          guestNumber: int.parse(guestNumber.value.toString()),
          onSuccess: (tableBookingResponse) {
            loading.hide();
            getAlltables();
            Get.back();
            // Get.offAllNamed(DashPageManager.routeName);
            SkySnackBar.success(
                title: "Booking Success", message: "Table booking success");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Booking Failed", message: message);
          });
    } else {
      SkySnackBar.error(
          title: "Error  Occurred",
          message: "Something went wrong while booking the table.");
    }
    // }
  }
}
