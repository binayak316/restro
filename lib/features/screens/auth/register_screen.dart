import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/auth/register_controller.dart';
import 'package:restro_management_sys/core/utils/constants/colors.dart';
import 'package:restro_management_sys/core/utils/constants/icon_paths.dart';
import 'package:restro_management_sys/core/utils/constants/image_path.dart';
import 'package:restro_management_sys/core/utils/helpers/validators.dart';
import 'package:restro_management_sys/core/widgets/common/button.dart';
import 'package:restro_management_sys/core/widgets/common/custom_text_style.dart';
import 'package:restro_management_sys/core/widgets/common/text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register-screen";
  final c = Get.find<RegisterController>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: c.registerKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(ImagePath.restroLogo,
                      height: 100, width: 150),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create New Account",
                    style: CustomTextStyles.f16W600(color: AppColors.primary),
                  ),
                ),
                Text(
                  "Username",
                  style: CustomTextStyles.f16W400(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 4,
                ),
                PrimaryTextField(
                  hint: "Enter your username",
                  controller: c.usernameController,
                  prefixIconPath: IconPath.user,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  validator: (value) => Validator.validateEmpty(value!),
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
                  prefixIconPath: IconPath.mail,
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validator.validateEmail(value!),
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Phone Number",
                  style: CustomTextStyles.f16W400(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 4,
                ),
                PrimaryTextField(
                  hint: "Enter your phone no.",
                  controller: c.phoneController,
                  prefixIconPath: IconPath.phone,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateMobile(value!),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
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
                    focusNode: c.passNode,
                    hint: "Password",
                    prefixIconPath: IconPath.lock,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z0-9!@#\$%&'*,\-_+.]"))
                    ],
                    obscureText: !c.showPass.value,
                    validator: (value) => Validator.validatePassword(value!),
                    controller: c.passwordController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    eyeClick: c.onEyeClick,
                    onSubmitted: (_) {
                      // c.conPassNode.requestFocus();
                    },
                    onValueChange: (String value) {},
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Confirm Password",
                  style: CustomTextStyles.f16W400(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 4,
                ),

                Obx(() => PrimaryTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z0-9!@#\$%&'*,\-_+.]"))
                      ],
                      hint: "Confirm Password",
                      prefixIconPath: IconPath.lock,
                      focusNode: c.conPassNode,
                      onSubmitted: (_) => c.onSubmit(),
                      obscureText: !c.showConPass.value,
                      eyeClick: c.onConEyeClick,
                      controller: c.conPasswordController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        var checkPassword = Validator.validatePassword(value!);
                        if (checkPassword != null) {
                          return checkPassword;
                        }

                        if (c.passwordController.text != value) {
                          return "Password does not match";
                        }
                        return null;
                      },
                    )),
                const SizedBox(
                  height: 37,
                ),
                PrimaryElevatedButton(
                  onPressed: c.onSubmit,
                  title: "Sign up",
                ),
                const SizedBox(
                  height: 6,
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Text(
                //     "Or",
                //     style: CustomTextStyles.f16W400(),
                //   ),
                // ),
                // const SizedBox(
                //   height: 6,
                // ),
                // PrimaryOutlineButton(
                //   onPressed: () {},
                //   title: "Continue with Google",
                //   suffixIconPath: IconPath.google,
                // ),
                // const SizedBox(
                //   height: 6,
                // ),
                // PrimaryOutlineButton(
                //   onPressed: () {},
                //   title: "Continue with Apple",
                //   suffixIconPath: IconPath.apple,
                // ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style:
                          CustomTextStyles.f15W600(color: AppColors.blackColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Login",
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
    );
  }
}
