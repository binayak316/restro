import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/profile/change_password_controller.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/utils/helpers/validators.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/core/widgets/common/text_form_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = "/change-password-screen";
  final c = Get.find<ChangePasswordController>();
  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Change Password",
          style: CustomTextStyles.f15W600(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.resetPwKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    IconPath.lockvector,
                    height: 80,
                    width: 80,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Reset your password here",
                    style:
                        CustomTextStyles.f15W400(color: AppColors.blackColor),
                  ),
                ),
                const SizedBox(
                  height: 49,
                ),
                Text(
                  "Enter Old Password",
                  style: CustomTextStyles.f16W400(color: AppColors.blackColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Obx(
                  () => PrimaryTextField(
                    hint: "Password",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    prefixIcon: SvgPicture.asset(
                      IconPath.unlock,
                    ),
                    focusNode: c.passNode,
                    obscureText: !c.showPass.value,
                    eyeClick: c.onEyeClick,
                    controller: c.passwordController,
                    validator: (value) => Validator.validatePassword(value!),
                    onSubmitted: (_) {
                      c.conPassNode.requestFocus();
                    },
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  "Enter New Password",
                  style: CustomTextStyles.f16W400(color: AppColors.blackColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Obx(
                  () => PrimaryTextField(
                    hint: "Confirm Password",
                    focusNode: c.conPassNode,
                    obscureText: !c.showConPass.value,
                    eyeClick: c.onConEyeClick,
                    controller: c.passwordConfirmController,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => Validator.validatePassword(value!),
                    prefixIcon: SvgPicture.asset(
                      IconPath.unlock,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryElevatedButton(
                    onPressed: () {
                      c.onSubmit();
                    },
                    title: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
