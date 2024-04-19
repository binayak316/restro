import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/model/order/cafe_checkout_request_params.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/product/controller/product_controller.dart';

class ShowAvailableTableSheet extends StatelessWidget {
  final c = Get.put(TableController());
  // final productDetailController = Get.find<ProductDetailController>();
  final productDetailController = Get.put(ProductDetailController());
  final cartController = Get.put(CartController());
  final Function(TableModelModel tableModelModel)
      onSelectTable; //yedi cart khali xa vane dekinxa natra dekhinna
  final CartModel? cart;
  // final int itemquantity;
  ShowAvailableTableSheet({
    super.key,
    // this.selectedRoomType,
    required this.onSelectTable,
    required this.cart,
    // required this.itemquantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Select Table",
                  style: CustomTextStyles.f16W600(color: AppColors.blackColor),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Obx(
                () => Text(
                  "Selected Table: ${cartController.selectedTable.value?.name ?? ""}",
                  style: CustomTextStyles.f16W600(
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ),
          const Divider(
            color: AppColors.blackColor,
            endIndent: 10,
            indent: 10,
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: c.availableTablesList.length,
              itemBuilder: (context, index) {
                var availableTable = c.availableTablesList[index];
                return ListTile(
                  onTap: () {
                    // Navigator.of(context).pop();
                    onSelectTable(availableTable);
                    // cartController.showCheckoutBottomSheet(cart!);
                  },
                  title: Text(
                    availableTable.name ?? "",
                    style: CustomTextStyles.f16W400(),
                  ),
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: AppColors.redColor,
                  selected: true,
                  style: ListTileStyle.drawer,
                );
              },
            ),
          ),
          PrimaryElevatedButton(
              onPressed: () {
                // print(
                //     "-------table_id---${cartController.selectedTable.value?.id}");

                // print("cart-----${cart?.id}");

                // print("quantity-----${cart?.itemsCount}");

                // print("-------refrenceId----khalti bata auxa");

                KhaltiScope.of(context).pay(
                    config: PaymentConfig(
                      // amount: int.parse(cart!.cartTotal.toString()) * 100,
                      amount: 10 * 100,
                      productIdentity: 'restro-money',
                      productName: 'restro-item-price',
                    ),
                    preferences: [
                      PaymentPreference.khalti,
                      // PaymentPreference.connectIPS,
                    ],
                    onSuccess: (PaymentSuccessModel su) {
                      cartController.cafeCheckoutParams = CafeCheckoutParams(
                        cartId: cart!.id.toString(),
                        orderType: "Physical",
                        tableId: cartController.selectedTable.value?.id,
                        referenceId: su.idx,
                      );

                      // cartcontroller.pos(c.bModal);
                      cartController
                          .postCheckout(cartController.cafeCheckoutParams);

                      Get.back();
                      SkySnackBar.success(
                          title: "Payment", message: "Payment Successful");
                    },
                    onFailure: (fa) {
                      Get.back();
                      SkySnackBar.error(
                          title: "Failed", message: "Error Failed");
                    },
                    onCancel: () {
                      Get.back();
                      ("Payment cancelled!!",);
                    });
              },
              title: "Proceed"),
        ],
      ),
    );
  }
}
