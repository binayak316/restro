import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/model/category_model.dart';
import 'package:restro_management_sys/core/model/order/cafe_checkout_request_params.dart';
import 'package:restro_management_sys/core/model/table/my_reserve_tabe.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
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

import '../../../core/controllers/dashscreen/home/home_screen_controller.dart';
import '../../../core/model/item_model.dart';
import '../../../core/controllers/dashscreen/home/search_product_controller.dart';
import '../../../core/utils/constants/apis.dart';
import '../../../core/widgets/common/error_view.dart';
class MyReservedTables extends StatelessWidget {
  static const String routeName = "/my-reserved-tables";
  final c = Get.find<MyReservedTableController>();
  MyReservedTables({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Reserved tables"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  if (c.pageState.value == PageState.LOADING) {
                    return Center(
                      child: LinearProgressIndicator(),
                    );
                  } else if (c.pageState.value == PageState.EMPTY) {
                    return EmptyView(
                      message:
                          "Looks like there is no reserved table on your name.",
                      title: "No tables at the moment",
                      media: IconPath.empty,
                    );
                  } else if (c.pageState.value == PageState.NORMAL) {
                    return SizedBox(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // number of items in each row
                                mainAxisSpacing: 10, // spacing between rows
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.7 // spacing between columns
                                ),
                        itemCount: c.myReservedTablesList.length,
                        itemBuilder: (context, index) {
                          var table = c.myReservedTablesList[index];
                          return GestureDetector(
                            onTap: () {
                              c.unReserveTable(table.id!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: AppColors.redColor),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(IconPath.tableBooking),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(table.date != null
                                      ? "Booked Date: ${table.date}"
                                      : ""),
                                  Text(table.time != null
                                      ? "Booked Time: ${table.time}"
                                      : ""),
                                  Text(table.guestCount != null
                                      ? "Guests Count: ${table.guestCount}"
                                      : ""),
                                  Text(table.user?.name != null
                                      ? "Booked By: ${table.user?.name}"
                                      : ""),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
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
        ));
  }
}
