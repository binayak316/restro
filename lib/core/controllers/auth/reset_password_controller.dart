
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/repo/auth_repo.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/auth/login_screen.dart';

import '../../widgets/custom/app_progress_dialog.dart';

class ResetPasswordController extends GetxController {
  RxnString userOtp = RxnString();
  RxnString userToken = RxnString();
  @override
  void onInit() {
    var args = Get.arguments;

    if (args != null) {
      userOtp.value = args['otp'];
      userToken.value = args['token'];
    }

    super.onInit();
  }

  final resetPwKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordConController = TextEditingController();

  final ProgressDialog loading = ProgressDialog();

  final FocusNode passNode = FocusNode();
  final FocusNode conPassNode = FocusNode();

  RxBool showPass = RxBool(false);
  RxBool showConPass = RxBool(false);

  void onEyeClick() {
    showPass.value = !showPass.value;
  }

  void onConEyeClick() {
    showConPass.value = !showConPass.value;
  }

  Future<void> onReset() async {
    if (resetPwKey.currentState!.validate()) {
      loading.show();
      log(passwordController.text);
      log(passwordConController.text);
      log("user token--->${userToken.value}");
      log("user token--->${userOtp.value}");

      await AuthRepo.resetPassword(
          password: passwordConController.text,
          otp: userOtp.value.toString(),
          token: userToken.value.toString(),
          onSuccess: (message) {
            loading.hide();
            Get.offAllNamed(LoginScreen.routeName);
            SkySnackBar.success(title: "Reset password", message: message);
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Reset password", message: message);
          });
    }
  }
}
