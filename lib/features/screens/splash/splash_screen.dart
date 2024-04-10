import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/splash_controller.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/image_path.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash-screen';
  final c = Get.find<SplashController>();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(ImagePath.restroLogo, height: 200, width: 200),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Rain or shine, it's a fine time to dine.",
              style: CustomTextStyles.f16W600(color: AppColors.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
