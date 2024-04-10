import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';
import 'package:restro_management_sys/core/utils/helpers/storage_helper.dart';
import 'package:restro_management_sys/core/widgets/custom/app_snackbar.dart';

class SkyRequest {
  //authenticated post api ----------------------------
  static Future<http.Response> post(String url,
      {Map<String, String>? headers, Object? body}) async {
    try {
      var token = StorageHelper.getAccessToken();

      print("---------------$token");

      headers ??= <String, String>{};
      headers["Content-Type"] = "application/json";
      headers["Accept"] = "application/json";
      headers["Authorization"] = token.toString();

      print("---------------$token");

      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body != null ? json.encode(body) : null,
      );

      LogHelper.info("Post Request Header ==> $url",
          error: json.encode(headers));
      LogHelper.info("Post Request Payload ==> $url", error: json.encode(body));
      LogHelper.info("Post Request Response ==> $url", error: response.body);

      if (response.statusCode == 401) {
        // Get.offAllNamed(LoginScreen.routeName);
      }

      return response;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw "Server Error";
    }
  }

// unauth post api-------------------------------
  // static Future<http.Response> post(String url,
  //     {Map<String, String>? headers, Object? body}) async {
  //   try {
  //     // var token = StorageHelper.getAccessToken();

  //     headers ??= <String, String>{};
  //     headers["Content-Type"] = "application/json";
  //     headers["Accept"] = "application/json";
  //     // headers["Authorization"] = token.toString();

  //     http.Response response = await http.post(
  //       Uri.parse(url),
  //       headers: headers,
  //       body: body != null ? json.encode(body) : null,
  //     );

  //     LogHelper.info("Post Request Header ==> $url",
  //         error: json.encode(headers));
  //     LogHelper.info("Post Request Payload ==> $url", error: json.encode(body));
  //     LogHelper.info("Post Request Response ==> $url", error: response.body);

  //     if (response.statusCode == 401) {
  //       Get.find<CoreController>().logOut();
  //       Get.closeAllSnackbars();
  //       SkySnackBar.info(
  //           title: "Session Expired",
  //           message: "Your session has expired!!. Please Log in to continue");
  //     }

  //     return response;
  //   } catch (e, s) {
  //     LogHelper.error("$url POST", error: e, stackTrace: s);
  //     throw "Server Error";
  //   }
  // }

  // authenticated get api --------------------------------

  static Future<http.Response> get(String url,
      {Map<String, String>? headers}) async {
    try {
      var token = StorageHelper.getAccessToken();
      headers ??= <String, String>{};
      headers["Content-Type"] = "application/json";
      headers["Accept"] = "application/json";
      headers["Authorization"] = token.toString();

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      LogHelper.info("Post Request Header ==> $url",
          error: json.encode(headers));
      LogHelper.info("Post Request Response ==> $url", error: response.body);

      if (response.statusCode == 401) {
        // Get.find<CoreController>().logOut();///--------------------------------------------
        Get.closeAllSnackbars();
        SkySnackBar.info(
            title: "Session Expired",
            message: "Your session has expired!!. Please Log to continue");
      }
      return response;
    } catch (e) {
      log(e.toString());
      throw "Server Error";
    }
  }

  // un authenticated get api------------------------------------------
  // static Future<http.Response> get(String url,
  //     {Map<String, String>? headers}) async {
  //   try {
  //     headers ??= <String, String>{};
  //     headers["Content-Type"] = "application/json";
  //     headers["Accept"] = "application/json";

  //     http.Response response = await http.get(
  //       Uri.parse(url),
  //       headers: headers,
  //     );

  //     LogHelper.info("Get Request Header ==> $url",
  //         error: json.encode(headers));
  //     LogHelper.info("Get Request Response ==> $url", error: response.body);

  //     if (response.statusCode == 401) {
  //       // Handle unauthorized error here if necessary
  //     }
  //     return response;
  //   } catch (e) {
  //     log(e.toString());
  //     throw "Server Error";
  //   }
  // }
}
