import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/auth/otp_verify_screen.dart';

import '../../repo/auth_repo.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> sendMailKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  ProgressDialog loading = ProgressDialog();

  Future<void> onSubmit() async {
    if (sendMailKey.currentState!.validate()) {
      loading.show();
      await AuthRepo.forgotPassword(
          email: emailController.text,
          onSuccess: (token) {
            loading.hide();
            Get.offAllNamed(OTPVerifyScreen.routeName, arguments: {
              "token": token,
            });
            SkySnackBar.success(title: "OTP", message: "Verify your OTP");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Forgot password", message: message);
          });
    }
  }
}
