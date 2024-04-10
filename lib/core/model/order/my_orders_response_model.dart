List<OrderItems> orderitemsFromJson(List<dynamic> orderitemsJson) =>
    List<OrderItems>.from(orderitemsJson
        .map((orderItemJson) => OrderItems.fromJson(orderItemJson)));

List<MyOrdersResponseModel> myOrdersFromJson(List<dynamic> myOrdersJson) =>
    List<MyOrdersResponseModel>.from(myOrdersJson
        .map((myOrderJson) => MyOrdersResponseModel.fromJson(myOrderJson)));

class MyOrdersResponseModel {
  int? id;
  int? userId;
  int? tableId;
  String? referenceId;
  String? salesTotal;
  String? discount;
  String? grandTotal;
  String? orderType;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<OrderItems>? items;
  Table? table;

  MyOrdersResponseModel(
      {this.id,
      this.userId,
      this.tableId,
      this.referenceId,
      this.salesTotal,
      this.discount,
      this.grandTotal,
      this.orderType,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.items,
      this.table});

  MyOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tableId = json['table_id'];
    referenceId = json['reference_id'];
    salesTotal = json['sales_total'];
    discount = json['discount'];
    grandTotal = json['grand_total'];
    orderType = json['order_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <OrderItems>[];
      json['items'].forEach((v) {
        items!.add(new OrderItems.fromJson(v));
      });
    }
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['table_id'] = this.tableId;
    data['reference_id'] = this.referenceId;
    data['sales_total'] = this.salesTotal;
    data['discount'] = this.discount;
    data['grand_total'] = this.grandTotal;
    data['order_type'] = this.orderType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
    return data;
  }
}

class OrderItems {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  String? price;
  String? total;
  String? createdAt;
  String? updatedAt;
  Product? product;

  OrderItems(
      {this.id,
      this.orderId,
      this.productId,
      this.quantity,
      this.price,
      this.total,
      this.createdAt,
      this.updatedAt,
      this.product});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? price;
  String? description;
  String? imageId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? image;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.imageId,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    imageId = json['image_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image_id'] = this.imageId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}

class Table {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  Table({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
