import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/core_controller.dart';
import 'package:restro_management_sys/core/repo/auth_repo.dart';
import 'package:restro_management_sys/core/utils/constants/messages.dart';
import 'package:restro_management_sys/core/widgets/custom/app_progress_dialog.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';
import 'package:restro_management_sys/features/screens/auth/otp_verify_screen.dart';
import 'package:restro_management_sys/features/screens/auth/reset_password_screen.dart';
import 'package:restro_management_sys/features/screens/dashscreen/dashboard_panel.dart';

class OtpVerifyController extends GetxController {
  final otpKey = GlobalKey<FormState>();

  final pinController = TextEditingController();
  final focusNode = FocusNode();

  final ProgressDialog loading = ProgressDialog();

  RxnString tokenOfUser = RxnString();
  RxnString emailString = RxnString();
  @override
  void onInit() {
    startTimer();
    var args = Get.arguments;

    if (args != null) {
      tokenOfUser.value = args['token'];
      emailString.value = args['email'];
    }

    super.onInit();
  }

//   //Time variables
  var remainingMinutes = "3".obs;
  var remainingSeconds = "00".obs;
  Timer? _timer;
  var remainingTime = 180.obs;

  void startTimer() {
    remainingTime.value = 180;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime <= 0) {
        _timer!.cancel();
      } else {
        remainingTime.value--;
        remainingMinutes.value = ((remainingTime ~/ 60).toInt()).toString();
        var seconds = (remainingTime % 60).toString();
        remainingSeconds.value = (seconds.length == 1) ? "0$seconds" : seconds;
      }
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> verifyOtp() async {
    print(tokenOfUser);
    print(pinController.text);
    if (tokenOfUser.value != null) {
      loading.show();

      await AuthRepo.verifyOtp(
          otp: pinController.text,
          userToken: tokenOfUser.value.toString(),
          onSuccess: (message) {
            loading.hide();
            Get.offAllNamed(ResetPasswordScreen.routeName, arguments: {
              "otp": pinController.text,
              "token": tokenOfUser.value,
            });
            SkySnackBar.success(title: "OTP verified", message: message);
          },
          onError: (message) {
            loading.hide();

            SkySnackBar.error(title: "OTP Verification", message: message);
          });
    } else {
      SkySnackBar.error(title: "OTP Verification", message: Messages.error);
    }
  }

//   Future<void> resendOtp() async {
//     // loading.show();
//     // await AuthRepo.resendVerificationCode(
//     //     userId: userId.value,
//     //     email: (emailString.value).toString(),
//     //     onSuccess: (message) {
//     //       startTimer();
//     //       loading.hide();
//     //       GearSnackBar.success(title: "OTP Verification", message: message);
//     //     },
//     //     onError: (message) {
//     //       loading.hide();
//     //       GearSnackBar.error(title: "OTP Verification", message: message);
//     //     });
//   }
}
