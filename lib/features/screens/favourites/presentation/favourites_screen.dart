import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/model/order/cafe_checkout_request_params.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/favourites/controller/favourite_controller.dart';
import 'package:restro_management_sys/features/screens/product/controller/product_controller.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = "/fav-screen";
  final c = Get.find<FavouriteController>();
  FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourites",
          style: CustomTextStyles.f16W600(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics: AlwaysScrollableScrollPhysics(),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 20, // spacing between rows
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.9 // spacing between columns
                      ),
                  // padding: const EdgeInsets.all(
                  //     8.0), // padding around the grid
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    // return InkWell(
                    //   onTap: () {
                    //     // Get.toNamed(Routes.map_screen);
                    //   },
                    //   child: ItemCard(

                    //   ),
                    // );
                    return Container(
                      child: Text("demo"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
