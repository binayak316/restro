import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/core_controller.dart';
import 'package:restro_management_sys/core/model/request_model.dart/register_request_params.dart';
import 'package:restro_management_sys/core/repo/auth_repo.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/auth/login_screen.dart';
import 'package:restro_management_sys/features/screens/auth/otp_verify_screen.dart';
import 'package:restro_management_sys/features/screens/dashscreen/dashboard_panel.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  final CoreController coreController = Get.find();
  ProgressDialog loading = ProgressDialog();

  RxBool showPass = RxBool(false);
  RxBool showConPass = RxBool(false);
  final FocusNode passNode = FocusNode();
  final FocusNode conPassNode = FocusNode();
  void onEyeClick() {
    showPass.value = !showPass.value;
  }

  void onConEyeClick() {
    showConPass.value = !showConPass.value;
  }

  Future<void> onSubmit() async {
    RegisterRequestParams regParams = RegisterRequestParams(
      name: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: conPasswordController.text,
      phoneNo: phoneController.text,
    );
    if (registerKey.currentState!.validate()) {
      loading.show();

      await AuthRepo.register(
          registerRequestParams: regParams,
          onSuccess: (user) {
            loading.hide();
            coreController.loadCurrentUser();
            Get.offAllNamed(LoginScreen.routeName);
            SkySnackBar.success(
                title: "Register Success",
                message: "Account created successfully");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Register Failed", message: message);
          });
    }
  }
}
