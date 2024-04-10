import 'package:get/get.dart';
import 'package:restro_management_sys/core/model/table/my_reserve_tabe.dart';
import 'package:restro_management_sys/core/repo/table_repo.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';

class MyReservedTableController extends GetxController {
  RxList<MyReserveTable> myReservedTablesList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;
  ProgressDialog loading = ProgressDialog();

  @override
  void onInit() {
    // TODO: implement onInit
    getAllMyReserved();
    super.onInit();
  }

  void getAllMyReserved() async {
    myReservedTablesList.clear();
    await TableRepo.getMyReserveTables(
      onSuccess: (myReservedTables) {
        if (myReservedTables.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          myReservedTablesList.addAll(myReservedTables);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }

  Rxn<MyReserveTable> myreservedTable = Rxn();
  Future<void> unReserveTable(int tableId) async {
    // if (tableKey.currentState!.validate()) {
    loading.show();
    await TableRepo.unreserveTable(
        // tableId: int.parse(myreservedTable.value!.id.toString()),
        tableId: tableId,
        onSuccess: (message) {
          loading.hide();
          getAllMyReserved();
          Get.back();
          // Get.offAllNamed(DashPageManager.routeName);
          Get.back();
          SkySnackBar.success(
              title: "Table Unreservation Cancel",
              message: "Table Unreservation success");
        },
        onError: (message) {
          loading.hide();
          SkySnackBar.error(
              title: "Table Unreservation Failed", message: message);
        });
  }
}
