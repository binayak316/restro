import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/core_controller.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/auth/otp_verify_screen.dart';
import 'package:restro_management_sys/features/screens/dashscreen/dashboard_panel.dart';

import '../../repo/auth_repo.dart';

class LoginController extends GetxController {
  final CoreController coreController = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ProgressDialog loading = ProgressDialog();
  RxBool showPass = RxBool(false);
  final FocusNode passNode = FocusNode();
  void onEyeClick() {
    showPass.value = !showPass.value;
  }

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  Future<void> onSubmit() async {
    if (loginKey.currentState!.validate()) {
      loading.show();
      await AuthRepo.login(
          email: emailController.text,
          password: passwordController.text,
          onSuccess: (user) {
            coreController.loadCurrentUser();

            loading.hide();
            Get.offAllNamed(DashPageManager.routeName);
            SkySnackBar.success(
                title: "Login Success", message: "User logged in successfully");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Login Failed", message: message);
          });
    }
  }
}
