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
import 'package:restro_management_sys/core/widgets/common/error_view.dart';
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
import 'package:restro_management_sys/features/screens/recent_orders/controller/my_orders_controller.dart';

class MyOrdersScreen extends StatelessWidget {
  static const String routeName = "/my-order";
  final c = Get.find<MyOrderController>();
  MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Orders",
          style: CustomTextStyles.f16W600(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                if (c.pageState.value == PageState.LOADING) {
                  return CategoryShimmer.gearList();
                } else if (c.pageState.value == PageState.EMPTY) {
                  return EmptyView(
                    message: "Looks like there is no items in the orders",
                    title: "No items at the moment",
                    media: IconPath.empty,
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 50),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: c.myOrdersList.length,
                      itemBuilder: (context, index) {
                        var orderItem = c.myOrdersList[index];
                        if (orderItem.items!.isNotEmpty) {
                          return Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderItem.referenceId != null
                                      ? "Ref Id: ${orderItem.referenceId.toString()}"
                                      : "",
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.blackColor),
                                ),
                                Text(
                                  orderItem.grandTotal != null
                                      ? "Rs. ${orderItem.grandTotal.toString()}"
                                      : "",
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.blackColor),
                                ),
                                Divider(
                                  color: AppColors.primary,
                                ),
                                ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: orderItem.items!.length,
                                  itemBuilder: (context, itemIndex) {
                                    var item = orderItem.items![itemIndex];
                                    return RecentOrderRowWidget(
                                      orderItem: item,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox(
                            height: 10,
                          );
                        }
                      });
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
      ),
    );
  }
}

class RecentOrderRowWidget extends StatelessWidget {
  // final String? imageUrl;
  // final String? itemName;
  // final String? price;
  // final String? grandTotal;
  // final String? refrenceId;

  final OrderItems? orderItem;
  const RecentOrderRowWidget({
    super.key,
    this.orderItem,
    // this.refrenceId,
    // this.grandTotal
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SkyNetworkImage(
                  imageUrl: orderItem?.product?.image ?? "",
                  width: 60,
                  height: 60,
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem?.product?.name ?? "",
                    style:
                        CustomTextStyles.f16W500(color: AppColors.blackColor),
                  ),
                  Text(
                    orderItem?.product?.price != null
                        ? "price: ${orderItem?.product?.price}"
                        : "",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.blackColor),
                  ),
                  Text(
                    orderItem?.product?.price != null
                        ? "price: ${orderItem?.product?.price}"
                        : "",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.blackColor),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.more_vert,
            color: AppColors.blackColor,
          )
        ],
      ),
    );
  }
}
