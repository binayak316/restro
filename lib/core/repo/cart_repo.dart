import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restro_management_sys/core/model/cart/cart_model.dart';
import 'package:restro_management_sys/core/utils/constants/apis.dart';
import 'package:restro_management_sys/core/utils/constants/messages.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';
import 'package:restro_management_sys/core/utils/helpers/sky_requests.dart';

class CartRepo {
  static Future<void> getCart({
    required Function(List<CartModel> cart) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.cart;
      http.Response response = await SkyRequest.get(url);
      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var cart = CartModel.fromJson(data['data']);
        var cart = cartsFromJson(data['data']);
        onSuccess(cart);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.cart, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> addToCart({
    required String productId,
    required String quantity,
    // required String tableId,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.addToCart;
      var body = {
        "product_id": productId,
        "quantity": quantity,
      };
      http.Response response = await SkyRequest.post(url, body: body);
      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var cart = CartModel.fromJson(data['data']);
        // var cart = cartsFromJson(data['data']);
        var msg = data['message'];
        onSuccess(msg);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.addToCart, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> deleteCartItem({
    required int itemId,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.deleteCartItem;
      var body = {
        "id": itemId,
      };
      http.Response response = await SkyRequest.post(url, body: body);
      dynamic data = json.decode(response.body);

      if (data['status']) {
        var msg = data['message'];
        onSuccess(msg);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.deleteCartItem, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> editCartItem({
    required int itemId,
    required int quantity,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.updateCartItem;
      var body = {
        "id": itemId,
        "quantity": quantity,
      };
      http.Response response = await SkyRequest.post(url, body: body);
      dynamic data = json.decode(response.body);

      if (data['status']) {
        var msg = data['message'];
        onSuccess(msg);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.updateCartItem, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }
}
