import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:restro_management_sys/core/model/category_model.dart';
import 'package:restro_management_sys/core/model/item_model.dart';
import 'package:restro_management_sys/core/utils/constants/apis.dart';
import 'package:http/http.dart' as http;
import 'package:restro_management_sys/core/utils/constants/messages.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';
import 'package:restro_management_sys/core/utils/helpers/sky_requests.dart';



class Categoryrepo {
  static Future<void> getCategories({
    required Function(List<MenuCategory> categories) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getCategories;

      print(url);

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var categories = categoriesFromJson(data['data']);

        print("---cate${categories}");
        onSuccess(categories);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getCategories, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  //get all products
  static Future<void> getProducts({
    required Function(List<CafeItem> items) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getAllProducts;

      print(url);

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var products = itemsFromJson(data['data']);

        onSuccess(products);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getAllProducts, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> searchProducts({
    String? keyword,
    required Function(List<CafeItem> items) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url =
          (Api.searchProducts.replaceAll("#keyword#", keyword.toString()));

      // String url = "${Api.searcgCafeProducts}?search-term=$keyword";

      http.Response response = await SkyRequest.get(
        url,
      );

      dynamic data = json.decode(response.body);

      if (data['status']) {
        // var msg = data['message'];
        var items = itemsFromJson(data['data']);

        print("--items--------${items}");
        onSuccess(items);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.searchProducts, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getItemsByCategoryId({
    required String categoryId,
    required Function(List<CafeItem> items) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = (Api.productsByCategoryId.replaceAll("#id#", categoryId));

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var items = itemsFromJson(data['data']);

        print("---cate${items}");
        onSuccess(items);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.productsByCategoryId, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getProductById({
    required num productId,
    required Function(CafeItem item) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      // String url = (Api.productsByCategoryId.replaceAll("#id#", productId));
      // String url = "${Api.getProductById}?id=$productId";

      String url = "${Api.getProductById}?id=$productId";

      http.Response response = await SkyRequest.get(
        url,
      );

      print("-----------url to get product detail --------${url}");
      print("---------------api get product by id--------------$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var item = CafeItem.fromJson(data['data']);
        print("bianyak pokhrel");
        // print("---cate${item}");
        onSuccess(item);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      print('------------------hahah');
      LogHelper.error(Api.getProductById, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }
}
