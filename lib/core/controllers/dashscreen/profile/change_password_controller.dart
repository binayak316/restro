import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/core_controller.dart';
import 'package:restro_management_sys/core/repo/auth_repo.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';

class ChangePasswordController extends GetxController {
  final coreController = Get.find<CoreController>();

  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final ProgressDialog loading = ProgressDialog();
  final resetPwKey = GlobalKey<FormState>();

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

  Future<void> onSubmit() async {
    if (resetPwKey.currentState!.validate()) {
      loading.show();
      await AuthRepo.changePassword(
          oldPassword: passwordController.text,
          newPassword: passwordConfirmController.text,
          onSuccess: (user) {
            coreController.loadCurrentUser();

            loading.hide();
            Get.back();
            SkySnackBar.success(
                title: "Password Change",
                message: "Your password has been successfully changed.");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Password Change", message: message);
          });
    }
  }
}
