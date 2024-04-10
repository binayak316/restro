import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restro_management_sys/core/model/order/my_orders_response_model.dart';
import 'package:restro_management_sys/core/utils/helpers/sky_requests.dart';

import '../model/order/cafe_checkout_request_params.dart';
import '../utils/constants/apis.dart';
import '../utils/constants/messages.dart';
import '../utils/helpers/log_helper.dart';

class OrderRepo {
  static Future<void> checkout({
    required CafeCheckoutParams? cafeCheckoutParams,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.checkout;

      var body = cafeCheckoutParams?.toJson();

      http.Response response = await SkyRequest.post(url, body: body);

      dynamic data = json.decode(response.body);

      if (data['status']) {
        var msg = data['message'];
        onSuccess(msg);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.checkout, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getMyOrders({
    required Function(List<MyOrdersResponseModel> myOrders) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.orders;
      http.Response response = await SkyRequest.get(url);
      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var cart = CartModel.fromJson(data['data']);
        var orders = myOrdersFromJson(data['data']);
        onSuccess(orders);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.orders, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }
}
