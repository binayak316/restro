// import 'package:cafe_management_system/core/controllers/dashscreen/cart/cart_controller.dart';
// import 'package:cafe_management_system/core/controllers/dashscreen/table/table_controller.dart';
// import 'package:cafe_management_system/core/model/item_model.dart';
// import 'package:cafe_management_system/core/model/table/table_model.dart';
// import 'package:cafe_management_system/core/utils/constants/colors.dart';
// import 'package:cafe_management_system/core/widgets/common/button.dart';
// import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
// import 'package:cafe_management_system/features/screens/product/controller/product_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SelectTableBottomSheet extends StatelessWidget {
//   final c = Get.put(TableController());
//   final productDetailController = Get.find<ProductDetailController>();
//   final cartController = Get.put(CartController());
//   final Function(TableModelModel tableModelModel)
//       onSelectTable; //yedi cart khali xa vane dekinxa natra dekhinna
//   final CafeItem? cafeitem;
//   final int itemquantity;
//   // final TableModelModel table;
//   SelectTableBottomSheet({
//     super.key,
//     // this.selectedRoomType,
//     required this.onSelectTable,
//     required this.cafeitem,
//     required this.itemquantity,
//     // required this.table,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.4,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   "Select Table",
//                   style: CustomTextStyles.f16W600(color: AppColors.blackColor),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 flex: 1,
//                 child: PrimaryElevatedButton(
//                   // width: 20,
//                   onPressed: () {
//                     productDetailController.addtoCart();
//                   },
//                   title: "Add to Cart",
//                   color: AppColors.primary,
//                   height: 40,
//                   // width: 50,
//                   textStyle: CustomTextStyles.f14W500(color: Colors.white),
//                 ),
//               )
//             ],
//           ),
//           const Divider(
//             color: AppColors.blackColor,
//             endIndent: 10,
//             indent: 10,
//             height: 20,
//           ),
//           // if (Get.put(CartController()).cartList.isEmpty)
//           cartController.cartList.isEmpty
//               ? Obx(() {
//                   if (c.availableTablesList.isEmpty) {
//                     return const LinearProgressIndicator();
//                   } else {
//                     return Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const ClampingScrollPhysics(),
//                         itemCount: c.availableTablesList.length,
//                         itemBuilder: (context, index) {
//                           var availableTable = c.availableTablesList[index];
//                           return ListTile(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                               onSelectTable(availableTable);
//                             },
//                             title: Text(
//                               availableTable.name ?? "",
//                               style: CustomTextStyles.f16W400(),
//                             ),
//                             dense: true,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             tileColor: AppColors.redColor,
//                             selected: true,
//                             style: ListTileStyle.drawer,
//                           );
//                         },
//                       ),
//                     );
//                   }
//                 })
//               : Text("You've already booked your table ")
//         ],
//       ),
//     );
//   }
// }
