import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/model/category_model.dart';
import 'package:restro_management_sys/core/model/item_model.dart';
import 'package:restro_management_sys/core/model/order/cafe_checkout_request_params.dart';
import 'package:restro_management_sys/core/model/order/my_orders_response_model.dart';
import 'package:restro_management_sys/core/model/table/my_reserve_tabe.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
import 'package:restro_management_sys/core/repo/cart_repo.dart';
import 'package:restro_management_sys/core/repo/category_repo.dart';
import 'package:restro_management_sys/core/repo/order_repo.dart';
import 'package:restro_management_sys/core/repo/table_repo.dart';
import 'package:restro_management_sys/core/utils/constants/apis.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:restro_management_sys/core/widgets/common/empty_view.dart';
import 'package:restro_management_sys/core/widgets/common/network_imge.dart';
import 'package:restro_management_sys/core/widgets/common/text_form_field.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/core/widgets/shimmer/product_shimmer.dart';
import 'package:restro_management_sys/features/screens/cart/cart_screen.dart';
import 'package:restro_management_sys/features/screens/favourites/controller/favourite_controller.dart';
import 'package:restro_management_sys/features/screens/home/search_product_screen.dart';
import 'package:restro_management_sys/features/screens/mytables/my_reserved_table_controller.dart';
import 'package:restro_management_sys/features/screens/product/controller/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/features/screens/product/presentation/product_detail_screen.dart';

class MyOrderController extends GetxController {
  RxList<MyOrdersResponseModel> myOrdersList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;
  ProgressDialog loading = ProgressDialog();

  @override
  void onInit() {
    // TODO: implement onInit
    getAllOrders();
    super.onInit();
  }

  void getAllOrders() async {
    myOrdersList.clear();
    await OrderRepo.getMyOrders(
      onSuccess: (orders) {
        if (orders.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          // cartItems.addAll(cart[0].items!);
          // for (var i in cart) {
          //   cartItems.addAll(i.items!);
          // }
          myOrdersList.addAll(orders);
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
