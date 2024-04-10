
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/dash_page_manager_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/home/search_product_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/profile/profile_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/table/table_controller.dart';
import 'package:restro_management_sys/features/screens/cart/cart_screen.dart';
import 'package:restro_management_sys/features/screens/favourites/controller/favourite_controller.dart';
import 'package:restro_management_sys/features/screens/home/search_product_screen.dart';
import 'package:restro_management_sys/features/screens/mytables/my_reserved_table_controller.dart';
import 'package:restro_management_sys/features/screens/mytables/my_reserved_tablesList.dart';
import 'package:restro_management_sys/features/screens/product/controller/product_controller.dart';
import 'package:restro_management_sys/features/screens/product/presentation/product_detail_screen.dart';
import 'package:restro_management_sys/features/screens/recent_orders/controller/my_orders_controller.dart';
import 'package:restro_management_sys/features/screens/recent_orders/presentation/my_orders_screen.dart';

import '../../../features/screens/dashscreen/dashboard_panel.dart';
import '../../../features/screens/favourites/presentation/favourites_screen.dart';
import '../../controllers/dashscreen/home/home_screen_controller.dart';

final List<GetPage> dashScreenPages = <GetPage>[
  GetPage(
    name: DashPageManager.routeName,
    page: () => DashPageManager(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => DashboardPanelController());
        Get.lazyPut(() => HomeScreenController());
        Get.lazyPut(() => CafeMenuItemsController());
        Get.lazyPut(() => TableController());
        Get.lazyPut(() => ProfileController());
        Get.lazyPut(() => CartController());

      
      },
    ),
  ),

  GetPage(
    name: ProductDetailScreen.routeName,
    page: () => ProductDetailScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ProductDetailController());
      },
    ),
  ),

  GetPage(
    name: FavouritesScreen.routeName,
    page: () => FavouritesScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => FavouriteController());
      },
    ),
  ),

  GetPage(
    name: SearchProductScreen.routeName,
    page: () => SearchProductScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => SearchProductController());
      },
    ),
  ),

  GetPage(
    name: CartScreen.routeName,
    page: () => CartScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => CartController());
      },
    ),
  ),

  GetPage(
    name: MyOrdersScreen.routeName,
    page: () => MyOrdersScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => MyOrderController());
      },
    ),
  ),

  GetPage(
    name: MyReservedTables.routeName,
    page: () => MyReservedTables(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => MyReservedTableController());
      },
    ),
  ),
//   // GetPage(
//   //   name: GearListsPage.routeName,
//   //   page: () => GearListsPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => GearListController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: ProfilePage.routeName,
//   //   page: () => ProfilePage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ProfileController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: ActivityPage.routeName,
//   //   page: () => ActivityPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ActivityController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: ChangePasswordPage.routeName,
//   //   page: () => ChangePasswordPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ChangePasswordController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: AdventureDetailPage.routeName,
//   //   page: () => AdventureDetailPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => AdventureDetailController());
//   //     },
//   //   ),
//   // ),
];
