import 'package:get/get.dart';
import 'package:restro_management_sys/core/controllers/auth/register_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/profile/change_password_controller.dart';
import 'package:restro_management_sys/core/controllers/dashscreen/profile/update_profile_controller.dart';
import 'package:restro_management_sys/features/screens/auth/register_screen.dart';
import 'package:restro_management_sys/features/screens/profile/change_password_screen.dart';
import 'package:restro_management_sys/features/screens/profile/update_profile_screen.dart';

import '../../../features/screens/auth/forgot_password_screen.dart';
import '../../../features/screens/auth/login_screen.dart';
import '../../../features/screens/auth/otp_verify_screen.dart';
import '../../../features/screens/auth/reset_password_screen.dart';
import '../../controllers/auth/forgot_controller.dart';
import '../../controllers/auth/login_controller.dart';
import '../../controllers/auth/otp_controller.dart';
import '../../controllers/auth/reset_password_controller.dart';

final List<GetPage> authPages = <GetPage>[
  GetPage(
    name: RegisterScreen.routeName,
    page: () => RegisterScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => RegisterController());
      },
    ),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => LoginController());
      },
    ),
  ),

  GetPage(
    name: ChangePasswordScreen.routeName,
    page: () => ChangePasswordScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ChangePasswordController());
      },
    ),
  ),

  GetPage(
    name: UpdateProfilScreen.routeName,
    page: () => UpdateProfilScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => UpdateProfileController());
      },
    ),
  ),

  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ForgotPasswordController());
      },
    ),
  ),
  GetPage(
    name: OTPVerifyScreen.routeName,
    page: () => OTPVerifyScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => OtpVerifyController());
      },
    ),
  ),
  GetPage(
    name: ResetPasswordScreen.routeName,
    page: () => ResetPasswordScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ResetPasswordController());
      },
    ),
  ),
//   // GetPage(
//   //   name: ForgotPasswordPage.routeName,
//   //   page: () => ForgotPasswordPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ForgotPasswordController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: NewPasswordPage.routeName,
//   //   page: () => NewPasswordPage(),
//   //     binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => NewPasswordPageController());
//   //     },
//   //   ),
//   // ),
];
