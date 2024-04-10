import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/widgets/common/common_alert.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/core/widgets/common/network_imge.dart';
import 'package:restro_management_sys/features/screens/favourites/presentation/favourites_screen.dart';
import 'package:restro_management_sys/features/screens/mytables/my_reserved_tablesList.dart';
import 'package:restro_management_sys/features/screens/recent_orders/presentation/my_orders_screen.dart';

import '../../../core/controllers/dashscreen/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile-page/";
  final c = Get.find<ProfileController>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const SkyNetworkImage(
                    imageUrl: "",
                    width: 60,
                    height: 60,
                    boxFit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c.coreController.currentUser.value?.name ?? "",
                      style: CustomTextStyles.f20W600(),
                    ),
                    Text(
                      c.coreController.currentUser.value?.email ?? "",
                      style: CustomTextStyles.f16W700(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileTiles(
                  onTap: () {},
                  iconUrl: IconPath.settings,
                  title: "Profile Setting",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    Get.toNamed(MyReservedTables.routeName);
                  },
                  iconUrl: IconPath.unreserveTable,
                  title: "Un-Reserve Table",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    Get.toNamed(MyOrdersScreen.routeName);
                  },
                  iconUrl: IconPath.orders,
                  title: "Recent Orders",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {},
                  iconUrl: IconPath.history,
                  title: "History",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    Get.toNamed(FavouritesScreen.routeName);
                  },
                  iconUrl: IconPath.fav,
                  title: "Favourite",
                ),
                Divider(
                  height: 10,
                  color: AppColors.lightGrey,
                  indent: 10,
                  endIndent: 10,
                ),
                ProfileTiles(
                  onTap: () {},
                  title: "About Us",
                  iconUrl: IconPath.aboutUs,
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  title: "Change Password",
                  onTap: () {},
                  iconUrl: IconPath.blackLock,
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  iconUrl: IconPath.logout,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return CustomAlertDialog(
                            // title: "Logout Confirmation",
                            message: "Are you sure to logout?",
                            onConfirm: () {
                              c.coreController.logOut();
                            },
                            confirmText: "Logout",
                          );
                        });
                  },
                  title: "Log out",
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class ProfileTiles extends StatelessWidget {
  final String? iconUrl;
  final String title;
  final Function() onTap;

  const ProfileTiles({
    super.key,
    this.iconUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: SvgPicture.asset(iconUrl ?? ""),
      title: Text(
        title,
        style: CustomTextStyles.f16W400(),
      ),
      trailing: SvgPicture.asset(IconPath.rightArrow),
    );
  }
}
