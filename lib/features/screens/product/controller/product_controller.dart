import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/model/category_model.dart';
import 'package:restro_management_sys/core/model/item_model.dart';
import 'package:restro_management_sys/core/model/order/cafe_checkout_request_params.dart';
import 'package:restro_management_sys/core/model/table/my_reserve_tabe.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
import 'package:restro_management_sys/core/repo/cart_repo.dart';
import 'package:restro_management_sys/core/repo/category_repo.dart';
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

class ProductDetailController extends GetxController {
  Rxn<CafeItem> cafeItem = Rxn();
  @override
  void onInit() {
    // TODO: implement onInit
    var args = Get.arguments;
    if (args != null) {
      cafeItem.value = args['cafeItem'];
    }
    getProductDetail();
    super.onInit();
  }

  RxInt itemQuantity = RxInt(1);

  void getProductDetail() async {
    print(cafeItem.value!.id!);
    // print(
    //     '--------------------------------------------------api hit getproductdetail');
    if (cafeItem.value?.id != null) {
      Categoryrepo.getProductById(
          productId: cafeItem.value!.id!,
          onSuccess: (item) {
            cafeItem.value = item;
          },
          onError: (message) {
            LogHelper.error(message);
          });
    } else {
      SkySnackBar.error(
          title: "Error Occurred",
          message: "Something went wrong while fetching detail page");
    }
  }

  void addtoCart() async {
    CartRepo.addToCart(
        productId: cafeItem.value!.id!.toString(),
        quantity: itemQuantity.value.toString(),
        // tableId: selectedTable.value!.id.toString(),
        onSuccess: (message) {
          SkySnackBar.success(title: "Cart", message: message);
        },
        onError: (message) {
          SkySnackBar.error(title: "Error Occurred", message: message);
        });
    // openTableSelectBottomSheet();
  }

//------------------------------BOTTOMSHEET FLOW
  // Rxn<TableModelModel> selectedTable = Rxn();

  // openTableSelectBottomSheet() async {
  //   // selectedTable.value =
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: Get.context!,
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: SelectTableBottomSheet(
  //           onSelectTable: (tableModelModel) {
  //             // roomTypeController.text = roomType.title.toString();
  //             selectedTable.value = tableModelModel;
  //             // this.roomType.value = roomType;
  //             // if (crudState.value == CRUDSTATE.UPDATE) {
  //             //   updateIndex.value = roomType
  //             //       .id; //instaed of new variable id assing  the id to roomType
  //             //
  //           },
  //           cafeitem: cafeItem.value,
  //           itemquantity: itemQuantity.value,
  //         ),
  //       );
  //     },
  //   );
  // }

//------------------------------BOTTOMSHEET FLOW

  // void getEventDetail() async {
  //   print(event.value?.id);
  //   if (event.value?.id != null) {
  //     EventRepo.getEventDetails(
  //       eventId: event.value!.id!,
  //       onSuccess: (event) {
  //         this.event.value = event;

  //         print("-----------------------${event}");
  //       },
  //       onError: (message) {
  //         LogHelper.error(message);
  //       },
  //     );
  //   } else {
  //     GearSnackBar.error(
  //         title: "Error Occurred",
  //         message: "Something went wrong while fetching detail page");
  //   }
  // }
}
