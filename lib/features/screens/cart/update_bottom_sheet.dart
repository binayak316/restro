import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';

class CartUpdateBottomSheet extends StatelessWidget {
  final c = Get.find<CartController>();
  final Items item;

  CartUpdateBottomSheet({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Update cart quantity",
            style: CustomTextStyles.f16W600(),
          ),
          const Divider(
            color: AppColors.blackColor,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (c.updateQuantity.value > 1) {
                      c.updateQuantity.value--;
                    }
                  },
                  icon: SvgPicture.asset(
                    IconPath.minus,
                    height: 25,
                    width: 25,
                  )),
              const SizedBox(
                width: 10,
              ),
              Obx(
                () => Text(
                  "${c.updateQuantity.value}",
                  style: CustomTextStyles.f32W600(color: AppColors.primary),
                ),
              ),
              // Text(
              //   "${item.quantity}",
              //   style: CustomTextStyles.f32W600(color: AppColors.primary),
              // ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    c.updateQuantity.value++;
                  },
                  icon: SvgPicture.asset(IconPath.plus, height: 25, width: 25))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: PrimaryOutlineButton(
                      onPressed: () {
                        Get.back();
                      },
                      title: "Cancel")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 2,
                  child: PrimaryElevatedButton(
                      onPressed: () {
                        // c.updateCartItem(c.updateQuantity.value);
                        c.updateCartItem(item.id!);
                      },
                      title: "Update")),
            ],
          )
        ],
      ),
    );
  }
}
