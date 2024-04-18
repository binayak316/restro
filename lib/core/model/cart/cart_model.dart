import 'package:restro_management_sys/core/model/item_model.dart';

List<Items> itemsFromJson(List<dynamic> itemsJson) =>
    List<Items>.from(itemsJson.map((itemsJson) => Items.fromJson(itemsJson)));

List<CartModel> cartsFromJson(List<dynamic> cartitemsJson) =>
    List<CartModel>.from(
        cartitemsJson.map((cartJson) => CartModel.fromJson(cartJson)));

class CartModel {
  int? id;
  int? userId;
  String? cartTotal;
  String? createdAt;
  String? updatedAt;
  String? itemsCount;
  List<Items>? items;
  // TableModelModel? tableModelModel;

  CartModel({
    this.id,
    this.userId,
    this.cartTotal,
    this.createdAt,
    this.updatedAt,
    this.itemsCount,
    this.items,
    // this.tableModelModel,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cartTotal = json['cart_total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemsCount = json['items_count'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }

    // tableModelModel =
    //     json['table'] != null ? TableModelModel.fromJson(json['table']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['cart_total'] = this.cartTotal;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['items_count'] = this.itemsCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }

    // if (this.tableModelModel != null) {
    //   data['table'] = this.tableModelModel!.toJson();
    // }
    return data;
  }
}

class Items {
  int? id;
  int? cartId;
  int? productId;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  CafeItem? cafeItem;

  Items({
    this.id,
    this.cartId,
    this.productId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.cafeItem,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cafeItem =
        json['product'] != null ? CafeItem.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cafeItem != null) {
      data['product'] = this.cafeItem!.toJson();
    }
    return data;
  }
}
