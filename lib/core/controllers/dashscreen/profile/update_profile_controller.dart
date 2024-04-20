import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/core_controller.dart';
import 'package:restro_management_sys/core/model/user_model.dart';
import 'package:restro_management_sys/core/repo/auth_repo.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';

class UpdateProfileController extends GetxController {
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();

  final coreController = Get.find<CoreController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    nameController.text = coreController.currentUser.value?.name ?? "";
    phoneController.text = coreController.currentUser.value?.phone ?? "";

    addressController.text = coreController.currentUser.value?.address ?? "";

    emailController.text = coreController.currentUser.value?.email ?? "";

    super.onInit();
  }

  RxBool showPass = RxBool(false);
  RxBool showConPass = RxBool(false);

  final FocusNode passNode = FocusNode();
  final FocusNode conPassNode = FocusNode();

  ProgressDialog loading = ProgressDialog();

  Future<void> onSubmit() async {
    if (updateProfileKey.currentState!.validate()) {
      loading.show();
      var user = User(
        name: nameController.text,
        address: addressController.text,
        phone: phoneController.text,
        email: emailController.text,
      );
      await AuthRepo.updateProfile(
          user: user,
          // onSuccess: (user) {
          //   loading.hide();
          //   // StorageHelper.saveUser(user);
          //   coreController.loadCurrentUser();
          //   // Get.offAllNamed(ProfileScreen.routeName);
          //   // Get.offNamed(ProfileScreen.routeName);
          //   // Get.offNamed(HomeScreen.routeName);
          //   Get.back();

          //   // Get.offNamed(ProfileScreen.routeName);
          //   GearSnackBar.success(
          //       title: "Update Success",
          //       message: "Account Updated successfully");
          // },
          onSuccess: (msg) {
            loading.hide();
            // StorageHelper.saveUser(user);
            coreController.loadCurrentUser();
            // Get.offAllNamed(ProfileScreen.routeName);
            // Get.offNamed(DashPageManager.routeName);
            // Get.offNamed(HomeScreen.routeName);
            Get.back();

            // Get.offNamed(ProfileScreen.routeName);
            SkySnackBar.success(
                title: "Update Success",
                message: "Account Updated successfully");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Update Failed", message: message);
          });
    }
  }
}
