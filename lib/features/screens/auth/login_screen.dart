import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/auth/login_controller.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/utils/constants/image_path.dart';
import 'package:restro_management_sys/core/utils/helpers/validators.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/features/screens/auth/forgot_password_screen.dart';
import 'package:restro_management_sys/features/screens/auth/register_screen.dart';

import '../../../core/widgets/common/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login-screen";
  final c = Get.find<LoginController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: c.loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  // SvgPicture.asset(
                  //   IconPath.cupLogo,
                  //   height: 80,
                  //   width: 80,
                  // ),
                  Center(
                    child: Image.asset(ImagePath.restroLogo,
                        height: 200, width: 200),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      " \" We are great to have you here \" ",
                      style: CustomTextStyles.f16W600(color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Email",
                    style: CustomTextStyles.f16W400(color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Enter your email address",
                    controller: c.emailController,
                    validator: (value) => Validator.validateEmail(value!),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    prefixIconPath: IconPath.mail,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                    style: CustomTextStyles.f16W400(color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Obx(
                    () => PrimaryTextField(
                      hint: "Password",

                      obscureText: !c.showPass.value,
                      validator: (value) => Validator.validatePassword(value!),
                      controller: c.passwordController,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      prefixIconPath: IconPath.lock,
                      eyeClick: c.onEyeClick,

                      // prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Get.toNamed(ForgotPasswordScreen.routeName);
                      },
                      radius: 10,
                      child: Text(
                        "Forgot Password?",
                        style: CustomTextStyles.f16W600(
                            color: AppColors.blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  PrimaryElevatedButton(
                    onPressed: c.onSubmit,
                    // onPressed: () {
                    //   Get.toNamed(DashPageManager.routeName);
                    // },
                    title: "Log in",
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: CustomTextStyles.f15W600(
                            color: AppColors.blackColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            "Sign Up",
                            style: CustomTextStyles.f15W600(
                                color: AppColors.primary),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
