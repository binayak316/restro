import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/core/widgets/common/empty_view.dart';
import 'package:restro_management_sys/core/widgets/common/error_view.dart';

class CafeMenuScreen extends StatelessWidget {
  static const String routeName = "/menu-screen";

  final c = Get.find<CafeMenuItemsController>();
  CafeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Hamro Restaurant Menu",
              style: CustomTextStyles.f28W600(color: AppColors.primary),
            ),
            Obx(() {
              if (c.pageState.value == PageState.LOADING) {
                return Center(
                  child: LinearProgressIndicator(),
                );
              } else if (c.pageState.value == PageState.EMPTY) {
                return EmptyView(
                  media: IconPath.empty,
                  message:
                      "Looks like there is no data available at the moment",
                  title: "Data not available",
                );
              } else if (c.pageState.value == PageState.NORMAL) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var category = c.cafeMenuSetList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name ?? "",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (category.products != null)
                          ListView.separated(
                            itemCount: category.products?.length ?? 0,
                            separatorBuilder: (context, index) {
                              if (category.products?.length != 0) {
                                return const SizedBox(
                                  height: 4,
                                );
                              } else {
                                return Text("menu fetching error");
                              }
                            },
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (category.products?.length != 0) {
                                var item = category.products?[index];

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 2, child: Text(item?.name ?? "")),
                                    const Expanded(
                                      flex: 3,
                                      child: Text(
                                          "-------------------------------------------------"),
                                    ),
                                    Text(item?.price ?? ""),
                                  ],
                                );
                              } else {
                                return ErrorView(
                                  media: IconPath.error,
                                  message: "Something went wrong",
                                  title: "Internal Server Error",
                                );
                              }
                            },
                          )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: c.cafeMenuSetList.length,
                  shrinkWrap: true,
                );

                // --------------------------
              } else {
                return ErrorView(
                  media: IconPath.error,
                  message: "Something went wrong",
                  title: "Internal Server Error",
                );
              }
            })
          ],
        ),
      ),
    ));
  }
}



// class MenuRowTile extends StatelessWidget {
//   const MenuRowTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Listvie
//   }
// }