import 'package:get/get.dart';
import 'package:restro_management_sys/core/model/cafe_product_menu_model.dart';
import 'package:restro_management_sys/core/repo/cafe_menu_items_repo.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';

class CafeMenuItemsController extends GetxController {
  RxList<CafeMenuSet> cafeMenuSetList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;

  @override
  void onInit() {
    getAllCafeMenuItems();
    super.onInit();
  }

  void getAllCafeMenuItems() async {
    cafeMenuSetList.clear();
    await MenuRepo.getCafeMenuSet(
      onSuccess: (menus) {
        if (menus.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          cafeMenuSetList.addAll(menus);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }
}
