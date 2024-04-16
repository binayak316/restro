import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/model/category_model.dart';
import 'package:restro_management_sys/core/utils/constants/apis.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/core/widgets/common/empty_view.dart';
import 'package:restro_management_sys/core/widgets/common/error_view.dart';
import 'package:restro_management_sys/core/widgets/common/network_imge.dart';
import 'package:restro_management_sys/core/widgets/common/text_form_field.dart';
import 'package:restro_management_sys/core/widgets/shimmer/product_shimmer.dart';
import 'package:restro_management_sys/features/screens/cart/cart_screen.dart';
import 'package:restro_management_sys/features/screens/home/search_product_screen.dart';
import 'package:restro_management_sys/features/screens/product/presentation/product_detail_screen.dart';

import '../../../core/controllers/dashscreen/home/home_screen_controller.dart';
import '../../../core/model/item_model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  final c = Get.find<HomeScreenController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Hamro Restaurant",
          style: CustomTextStyles.f28W600(),
        ),
        actions: [
          InkResponse(
              onTap: () {
                Get.toNamed(CartScreen.routeName);
              },
              child: Icon(
                Icons.shopping_cart_checkout,
                color: AppColors.primary,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryTextField(
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.primary,
              ),
              hint: "Search what your are looking for.....",
              readOnly: true,
              onTap: () {
                Get.toNamed(SearchProductScreen.routeName);
              },
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: Get.width,
                height: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    // BoxShadow(
                    //   color: Color.fromARGB(255, 204, 203, 203),
                    //   blurRadius: 1,
                    //   spreadRadius: 1,
                    //   offset: Offset(
                    //     0,
                    //     1,
                    //   ),
                    // )
                  ],
                ),
                child: Center(
                  child: Obx(() {
                    if (c.pageState.value == PageState.LOADING) {
                      return const Center(
                        child: LinearProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    } else if (c.pageState.value == PageState.EMPTY) {
                      return const Center(
                        child: Text("Empty Categories"),
                      );
                    } else if (c.pageState.value == PageState.NORMAL) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              c.selectedIndex.value = -1;
                              c.getAllProducts();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                  color: c.selectedIndex.value == -1
                                      ? AppColors.primary
                                      : AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.primaryFaded)),
                              child: Text(
                                "All",
                                style: CustomTextStyles.f16W500(
                                    color: c.selectedIndex.value == -1
                                        ? AppColors.whiteColor
                                        : AppColors.primary),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 5,
                                  );
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: ClampingScrollPhysics(),
                                itemCount: c.categoryList.length,
                                itemBuilder: (context, index) {
                                  var category = c.categoryList[index];
                                  if (category != null) {
                                    return Obx(
                                      () => GestureDetector(
                                        onTap: () {
                                          c.selectedIndex.value = index;
                                          c.getProductsByCategoryId(
                                              category.id!);
                                        },
                                        child: CoffeeCategory(
                                          category: category,
                                          backgroundColor: index ==
                                                  c.selectedIndex.value
                                              ? AppColors
                                                  .primary // Change background color if index matches selected index
                                              : AppColors.whiteColor,
                                          textColor: index ==
                                                  c.selectedIndex.value
                                              ? AppColors
                                                  .whiteColor // Change text color if index matches selected index
                                              : AppColors.primary,

                                          // backgroundColor: AppColors.primary,
                                          // textColor: AppColors.whiteColor,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: Text(
                                          "Error while fetching the categories"),
                                    );
                                  }
                                }),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text("Error View"),
                      );
                    }
                  }),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(() {
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 20, // spacing between rows
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.9 // spacing between columns
                              ),
                      itemCount: c.itemList.length,
                      itemBuilder: (context, index) {
                        var product = c.itemList[index];
                        return ItemCard(
                          cafeItem: product,
                        );
                      },
                    ),
                  );
                } else {
                  return ErrorView(
                    media: IconPath.error,
                    message: "Something went wrong",
                    title: "Internal Server Error",
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

class CoffeeCategory extends StatelessWidget {
  final MenuCategory category;
  final Color? backgroundColor;
  final Color? textColor;
  const CoffeeCategory(
      {super.key,
      required this.category,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryFaded,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        category.name ?? "",
        style: CustomTextStyles.f16W300(
            //TODO condition anusar check garne
            color: textColor),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  // final String? icon;
  // final String? title;
  // final String? price;
  final CafeItem cafeItem;

  ItemCard({
    super.key,
    required this.cafeItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(ProductDetailScreen.routeName, arguments: {
          "cafeItem": cafeItem,
        });
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
              // blurRadius: 1,
              // spreadRadius: 1,
              offset: Offset(
                0,
                1,
              ),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SkyNetworkImage(
                imageUrl: "${Api.imageUrl}${cafeItem.imageModel?.fileName}",
                height: 80,
                // width: 80,
                boxFit: BoxFit.contain,
                // alignment: Alignment.center,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cafeItem.name ?? "",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 14,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (cafeItem.price != null)
                    Text(
                      "Rs. ${cafeItem.price}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (cafeItem.description != null)
                    Text(
                      cafeItem.description ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 11,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
