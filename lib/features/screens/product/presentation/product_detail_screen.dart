import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/utils/constants/apis.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/core/widgets/common/network_imge.dart';
import 'package:restro_management_sys/features/screens/product/controller/product_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product-detail";
  final c = Get.find<ProductDetailController>();
  final cartController = Get.put(CartController());
  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // top: 0,
            left: 0,
            right: 0,
            height: Get.height / 2,
            child: Container(
              child: ClipRRect(
                child: SkyNetworkImage(
                  // imageUrl: "${Api.imageUrl}${cafeItem.imageModel?.fileName}",

                  imageUrl:
                      "${Api.imageUrl}${c.cafeItem.value?.imageModel?.fileName}" ??
                          "",
                  width: Get.width,
                  height: Get.height / 2,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 35,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 224, 224, 224)),
              child: InkResponse(
                borderRadius: BorderRadius.circular(10),
                radius: 10,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.blackColor,
                  size: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: Get.height / 2,
            child: Container(
              // height: Get.height,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        c.cafeItem.value?.name ?? "",
                        style:
                            CustomTextStyles.f28W600(color: AppColors.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (c.cafeItem.value?.price != null)
                        Text(
                          "Rs. ${c.cafeItem.value?.price ?? ""}", // Concatenate "Rs." with the price using string interpolation
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.f20W500(
                              color: AppColors.blackColor),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (c.cafeItem.value?.category != null)
                    Text(
                      "Category of this item: ${c.cafeItem.value?.category?.name ?? ""}", // Concatenate "Rs." with the price using string interpolation
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyles.f16W500(color: AppColors.blackColor),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    c.cafeItem.value?.description ?? "",
                    textAlign: TextAlign.center,
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Visibility(
        visible: true,
        child: Container(
          // height: 130,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 8,
                  spreadRadius: 2,
                  color: AppColors.lightGrey)
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (c.itemQuantity.value > 1) {
                            c.itemQuantity.value--;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            IconPath.minus,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Wrap(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: AppColors.blackColor, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minHeight: 16, minWidth: 16),
                              child: Center(
                                child: Text(
                                  c.itemQuantity.value.toString(),
                                  style: CustomTextStyles.f16W600(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        // onTap: c.addItem,
                        onTap: () {
                          c.itemQuantity.value++;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            IconPath.plus,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              // Obx(
              //   () => cartController.cartList.isNotEmpty
              //       ? Text(cartController.cartList[0].tableModelModel!.name
              //           .toString())
              //       : Obx(
              //           () {
              //             if (c.selectedTable.value != null) {
              //               return Expanded(
              //                 flex: 2,
              //                 child: Text(
              //                   "Selected Table: ${c.selectedTable.value?.name}",
              //                   style: CustomTextStyles.f16W600(
              //                       color: AppColors.primary),
              //                 ),
              //               );
              //             } else {
              //               return const Text("Please select table");
              //             }
              //           },
              //         ),
              // ),

              const SizedBox(
                width: 6,
              ),

              Expanded(
                flex: 1,
                child: PrimaryElevatedButton(
                  // width: 20,
                  onPressed: () {
                    c.addtoCart();
                  },
                  title: "Add to Cart",
                  color: AppColors.primary,
                  height: 40,
                  // width: 50,
                  textStyle: CustomTextStyles.f14W500(color: Colors.white),
                ),
              ),
              // ----------------bottom_sheet wala flow

              // InkResponse(
              //   onTap: () {
              //     // c.addtoCart();
              //     if (cartController.cartList.isNotEmpty) {
              //       c.selectedTable.value =
              //           cartController.cartList[0].tableModelModel;
              //     }
              //     // else {
              //     //   c.selectedTable.value = null;
              //     // }
              //     c.openTableSelectBottomSheet();
              //   },
              //   radius: 10,
              //   borderRadius: BorderRadius.circular(10),
              //   child: Container(
              //     padding: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       shape: BoxShape.rectangle,
              //       color: AppColors.lightGrey,
              //     ),
              //     child: SvgPicture.asset(
              //       IconPath.addToCart,
              //       height: 20,
              //       width: 20,
              //     ),
              //   ),
              // ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
