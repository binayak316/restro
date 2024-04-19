import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/model/order/cafe_checkout_request_params.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
import 'package:restro_management_sys/core/repo/cart_repo.dart';
import 'package:restro_management_sys/core/repo/order_repo.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/cart/show_available_table_sheet.dart';
import 'package:restro_management_sys/features/screens/cart/update_bottom_sheet.dart';
import 'package:restro_management_sys/features/screens/recent_orders/presentation/my_orders_screen.dart';

class CartController extends GetxController {
  RxList<CartModel> cartList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;
  ProgressDialog loading = ProgressDialog();

  // Rxn<Items> cartItem = Rxn();

  @override
  void onInit() {
    // TODO: implement onInit
    getAllCartItems();
    super.onInit();
  }

  void getAllCartItems() async {
    cartList.clear();
    await CartRepo.getCart(
      onSuccess: (cart) {
        if (cart.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          // cartItems.addAll(cart[0].items!);
          // for (var i in cart) {
          //   cartItems.addAll(i.items!);
          // }
          cartList.addAll(cart);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }

  void deleteCartItem(int itemId) async {
    await CartRepo.deleteCartItem(
      itemId: itemId,
      onSuccess: (message) {
        getAllCartItems();
        SkySnackBar.success(
            title: "Delete Success", message: "Item successfully deleted.");
      },
      onError: (message) {
        // pageState.value = PageState.ERROR;
        LogHelper.error(message);
        SkySnackBar.error(
            title: "Delete failed", message: "Item  deletion failed.");
      },
    );
  }

  void updateCartItem(int updateItemId) async {
    // if (cartItem.value != null) {

    // } else {
    //   SkySnackBar.error(
    //       title: "Update failed", message: "Item  updation failed.");
    // }
    loading.show();
    print("---itemid---${updateItemId}");
    print("-----quantity----${updateQuantity.value}");
    await CartRepo.editCartItem(
      itemId: updateItemId,
      // quantity: cartItem.value!.quantity!,
      quantity: updateQuantity.value,
      onSuccess: (message) {
        loading.hide();
        Get.back();

        getAllCartItems();
        SkySnackBar.success(
            title: "Update Success", message: "Item successfully updated.");
      },
      onError: (message) {
        loading.hide();

        // pageState.value = PageState.ERROR;
        LogHelper.error(message);
        SkySnackBar.error(
            title: "Update failed", message: "Item  updation failed.");
      },
    );
  }

  RxInt updateQuantity = RxInt(1);
  showBottomSheet(Items item) {
    updateQuantity.value = int.parse(item.quantity.toString());
    showModalBottomSheet(
      isScrollControlled: true,
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: CartUpdateBottomSheet(
            item: item,
          ),
        );
      },
    );
  }

  Rxn<TableModelModel> selectedTable = Rxn();
  // Rxn<CafeItem> cafeItem = Rxn();
  // RxInt itemQuantity = RxInt(1);

  showAvailableTableBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ShowAvailableTableSheet(
            onSelectTable: (tableModelModel) {
              selectedTable.value = tableModelModel;
            },
            // cafeitem: cafeItem.value,
            cart: cartList.isNotEmpty ? cartList[0] : null,
            // itemquantity: itemQuantity.value,
          ),
        );
      },
    );
  }

  // showCheckoutBottomSheet(CartModel cart) {
  //   print("-------cart--------${cart.id}");
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: Get.context!,
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: CheckoutBottomSheet(),
  //       );
  //     },
  //   );
  // }
  CafeCheckoutParams? cafeCheckoutParams;
  Future<void> postCheckout(CafeCheckoutParams? cafeCheckoutParams) async {
    loading.show();
    await OrderRepo.checkout(
        cafeCheckoutParams: cafeCheckoutParams,
        onSuccess: (message) {
          loading.hide();

          Get.offNamed(MyOrdersScreen.routeName);

          // Get.offNamed(DashPageManager
          //     .routeName); //TODO :yo page le kam gareko xaina api hit hanna parxa yaha
          SkySnackBar.success(
              title: "Checkout Suceess ",
              message: "Order checkout successfully");
        },
        onError: (message) {
          loading.hide();

          SkySnackBar.error(
              title: "Checkout Failed ", message: "Order checkout Failed");
        });
  }
}
