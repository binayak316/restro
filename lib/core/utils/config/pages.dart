// import 'package:chalchitra2/core/controllers/splash_controller.dart';
// import 'package:chalchitra2/core/utils/config/auth_pages.dart';
// import 'package:chalchitra2/core/utils/config/dash_pages.dart';
// import 'package:chalchitra2/features/screens/splash_screen.dart';
// import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:restro_management_sys/core/utils/config/dash_pages.dart';

import '../../../features/screens/splash/splash_screen.dart';
import '../../controllers/splash_controller.dart';
import 'auth_pages.dart';

final List<GetPage> getPages = <GetPage>[
  ...authPages,
  ...dashScreenPages,
  GetPage(
      name: SplashScreen.routeName,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SplashController());
      })),
// //   GetPage(
// //       name: OnboardingPage.routeName,
// //       page: () => const OnboardingPage(),
// //       binding: BindingsBuilder(() {
// //         Get.lazyPut(() => SignInPageController());
// //       })),
// //   GetPage(
// //     name: SelectBrandModelPage.routeName,
// //     page: () => SelectBrandModelPage(),
// //     // binding: BindingsBuilder(
// //     //   () {
// //     //     Get.lazyPut(() => ChipsController());
// //     //   },
// //     // ),
// //   ),
// //   // GetPage(
// //   //   name: ProfilePage.routeName,
// //   //   page: () => ProfilePage(),
// //   //   binding: BindingsBuilder(
// //   //     () {
// //   //       Get.lazyPut(() => ProfileController());
// //   //     },
// //   //   ),
// //   // ),
// //   GetPage(
// //     name: AccountPage.routeName,
// //     page: () => AccountPage(),
// //   ),
// //   GetPage(
// //     name: ProfileEditPage.routeName,
// //     page: () => ProfileEditPage(),
// //     binding: BindingsBuilder(
// //       () {
// //         Get.lazyPut(() => ProfileEditController());
// //       },
// //     ),
// //   ),
// //   GetPage(
// //     name: HomePage.routeName,
// //     page: () => HomePage(),
// //     binding: BindingsBuilder(
// //       () {
// //         Get.lazyPut(() => HomePageController());
// //       },
// //     ),
// //   ),
// //   GetPage(
// //     name: ManualPage.routeName,
// //     page: () => ManualPage(),
// //     binding: BindingsBuilder(
// //       () {
// //         Get.lazyPut(() => ManualAddController());
// //       },
// //     ),
// //   ),
// //   GetPage(
// //       name: CreateTagsPage.routeName,
// //       page: () => CreateTagsPage(),
// //       binding: BindingsBuilder(() {
// //         Get.lazyPut(() => GearListCreationController());
// //         Get.lazyPut(
// //           () => CreateTagsController(),
// //         );
// //       })),
// //   GetPage(
// //     name: GearListCreationPage.routeName,
// //     page: () => GearListCreationPage(),
// //     binding: BindingsBuilder(
// //       () {
// //         Get.lazyPut(() => GearListCreationController());
// //       },
// //     ),
// //   ),
// //   GetPage(
// //     name: AddGearItemPage.routeName,
// //     page: () => AddGearItemPage(),
// //     binding: BindingsBuilder(() {
// //       Get.lazyPut(() => ItemController());
// //     }),
// //   ),
// //   GetPage(
// //     name: GearDetailPage.routeName,
// //     page: () => GearDetailPage(),
// //     binding: BindingsBuilder(() {
// //       Get.lazyPut(() => GearDetailController());
// //     }),
// //   ),
// //   GetPage(
// //     name: GearListViewPage.routeName,
// //     page: () => GearListViewPage(),
// //     binding: BindingsBuilder(() {
// //       Get.lazyPut(() => GearListViewController());
// //     }),
// //   ),
// //   GetPage(
// //       name: MyGearListsPage.routeName,
// //       page: () => MyGearListsPage(),
// //       binding: BindingsBuilder(() {
// //         Get.lazyPut(() => GearListController());
// //       }))
];
