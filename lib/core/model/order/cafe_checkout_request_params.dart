class CafeCheckoutParams {
  String? cartId;
  String? orderType;
  int? tableId;
  String? referenceId;

  CafeCheckoutParams(
      {this.cartId, this.orderType, this.tableId, this.referenceId});

  CafeCheckoutParams.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    orderType = json['order_type'];
    tableId = json['table_id'];
    referenceId = json['reference_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['order_type'] = this.orderType;
    data['table_id'] = this.tableId;
    data['reference_id'] = this.referenceId;
    return data;
  }
}
