import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/core/model/table/table_model.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';

class TableReservationBottomSheet extends StatelessWidget {
  final c = Get.find<TableController>();
  final TableModelModel table;
  TableReservationBottomSheet({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Table Name: ${table.name}",
              style: CustomTextStyles.f28W600(
                color: AppColors.blackColor,
              ),
            ),
          ),
          const Divider(
            color: AppColors.blackColor,
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (c.pickedSplittedDate != null && c.pickedSplittedDate != "")
                  Obx(
                    () => Text(
                      "Booked Date:   ${c.pickedSplittedDate.value}",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (c.pickedSplittedTime != null && c.pickedSplittedTime != "")
                  Obx(
                    () => Text(
                      "Booked Time:   ${c.pickedSplittedTime.value}",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Number of Guest for table"),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkResponse(
                    onTap: () {
                      c.onDecrement();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        shape: BoxShape.rectangle,
                        color: AppColors.lightGrey,
                      ),
                      child: SvgPicture.asset(IconPath.minus),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkResponse(
                    onTap: () {
                      c.onIncrement();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        shape: BoxShape.rectangle,
                        color: AppColors.lightGrey,
                      ),
                      child: SvgPicture.asset(IconPath.plus),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                      shape: BoxShape.circle),
                  child: Text(
                    c.guestNumber.value.toString(),
                    style: CustomTextStyles.f32W600(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            // height: 100,
            // width: 200,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: PrimaryOutlineButton(
                    // onPressed: c.onSubmit,
                    onPressed: () {
                      c.guestNumber.value = 1;
                      Get.back();
                    },
                    title: "Cancel",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: PrimaryElevatedButton(
                    // onPressed: c.onSubmit,
                    onPressed: () {
                      // Get.back();
                      c.onSubmit();
                    },
                    title: "Book Table",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
