import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/utils/constants/apis.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/empty_view.dart';
import 'package:restro_management_sys/core/widgets/common/network_imge.dart';
import 'package:restro_management_sys/core/widgets/common/text_form_field.dart';
import 'package:restro_management_sys/core/widgets/shimmer/product_shimmer.dart';
import 'package:restro_management_sys/features/screens/product/presentation/product_detail_screen.dart';

import '../../../core/controllers/dashscreen/home/home_screen_controller.dart';
import '../../../core/controllers/dashscreen/home/search_product_controller.dart';
import '../../../core/model/item_model.dart';
import '../../../core/widgets/common/error_view.dart';

class SearchProductScreen extends StatelessWidget {
  static const String routeName = "/search-product";
  final c = Get.find<SearchProductController>();
  SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryTextField(
          autofocus: true,
          hint: "Search Item...",
          controller: c.searchController,
          onValueChange: (value) {
            c.onTextChange(value);
          },
          onSubmitted: (_) {
            c.searchItems();
          },
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.primary,
          ),
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.name,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                if (c.pageState.value == PageState.LOADING) {
                  return CategoryShimmer.categoryGrid();
                } else if (c.pageState.value == PageState.EMPTY) {
                  return EmptyView(
                    media: IconPath.empty,
                    message:
                        "Looks like there is no data available at the moment",
                    title: "Data not available",
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 20, // spacing between rows
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.8 // spacing between columns
                              ),
                      itemCount: c.searchList.length,
                      itemBuilder: (context, index) {
                        var product = c.searchList[index];
                        return SearchEventCard(
                          item: product,
                        );
                      },
                    ),
                  );
                } else {
                  return ErrorView(
                    message: "No Data Available.",
                    title: "No Data available at the moment",
                    media: IconPath.error,
                    mediaSize: Get.height / 4,
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

class SearchEventCard extends StatelessWidget {
  final c = Get.find<HomeScreenController>();
  // final String? icon;
  // final String? title;
  // final VoidCallback? onTap;
  // final String? location;
  // final String? price;
  final CafeItem item;
  SearchEventCard({
    super.key,
    // required this.icon,
    // required this.title,
    // this.onTap,
    // this.location,
    // required this.price,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(ProductDetailScreen.routeName,
            arguments: {"cafeItem": item});
      },
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 6),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 204, 203, 203),
              blurRadius: 2.0,
              spreadRadius: 1,
              offset: Offset(
                0,
                3,
              ),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SvgPicture.network(
            //   // APIPathHelper.imageUrl + icon.toString(),
            //   // IconPath.apple,
            //   "$icon",
            //   height: 35,
            //   width: 35,
            //   alignment: Alignment.center,
            // ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child:
                    //  SvgPicture.asset(
                    //   "$icon",
                    //   height: 80,
                    //   width: 80,
                    //   alignment: Alignment.center,
                    // ),
                    SkyNetworkImage(
                  imageUrl: "${Api.imageUrl}${item.imageModel?.fileName}",
                  height: 80,
                  // width: 80,
                  boxFit: BoxFit.fitWidth,
                  // alignment: Alignment.center,
                ),
              ),
            ),

            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    // Text(
                    //   event.organizerId ?? "",
                    //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    //         fontSize: 14,
                    //         color: AppColors.primary,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    // ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      item.price != null ? "Price: ${item.price}" : "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       event.eventTime ?? "",
                    //       style:
                    //           Theme.of(context).textTheme.titleLarge?.copyWith(
                    //                 fontSize: 14,
                    //                 color: AppColors.blackColor,
                    //                 fontWeight: FontWeight.w600,
                    //               ),
                    //     ),
                    //     const SizedBox(
                    //       width: 4,
                    //     ),
                    //     if (event.organizerId !=
                    //         c.coreController.currentUser.value?.id)
                    //       Container(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 8, vertical: 4),
                    //         decoration: BoxDecoration(
                    //           color: AppColors.primary,
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Text(
                    //           "Book Now",
                    //           style: CustomTextStyles.f14W300(
                    //               color: AppColors.whiteColor),
                    //         ),
                    //       ),
                    //   ],
                    // )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
