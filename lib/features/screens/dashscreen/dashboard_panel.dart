import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/features/screens/cart/cart_screen.dart';

import '../../../core/controllers/dashscreen/dash_page_manager_controller.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/icon_paths.dart';
import '../cafe_menu/restro_menu_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../table_booking/table_booking_screen.dart';

class DashPageManager extends StatelessWidget {
  static const String routeName = "/dashscreen";

  final c = Get.find<DashboardPanelController>();

  DashPageManager({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.zero,
          height: 60,
          notchMargin: 4,
          elevation: 0,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColors.whiteColor,
            // showSelectedLabels: true,
            // showUnselectedLabels: false,
            // unselectedItemColor: AppColors.primary.withOpacity(0.8),
            unselectedItemColor: AppColors.lightGrey,
            selectedItemColor: AppColors.primary,
            type: BottomNavigationBarType.fixed,
            currentIndex: c.currentIndex.value,
            onTap: c.onPageTapped,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconPath.home,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset(
                  IconPath.home,
                  height: 20,
                  width: 20,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconPath.upcoming,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset(
                  IconPath.upcoming,
                  height: 20,
                  width: 20,
                ),
                label: "Table",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconPath.cart,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset(
                  IconPath.cart,
                  height: 20,
                  width: 20,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconPath.menu,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset(
                  IconPath.menu,
                  height: 20,
                  width: 20,
                ),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconPath.user,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset(
                  IconPath.userBlack,
                  height: 20,
                  width: 20,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: c.pageController,
        children: [
          HomeScreen(),
          TableBookingScreen(),
          CartScreen(),
          CafeMenuScreen(),
          ProfileScreen(),
          // UnAuthenticatedScreen(),
        ],
      ),
    );
  }
}
