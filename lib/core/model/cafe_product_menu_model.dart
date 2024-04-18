import 'item_model.dart';

List<CafeMenuSet> cafeMenuItemsFromJson(List<dynamic> cafemenusJson) =>
    List<CafeMenuSet>.from(
      cafemenusJson.map(
        (cafeMenuJson) => CafeMenuSet.fromJson(cafeMenuJson),
      ),
    );

class CafeMenuSet {
  int? id;
  String? name;
  List<CafeItem>? products;
  String? image;

  CafeMenuSet(
      {this.id,
      this.name,
     
      this.products,
      this.image});

  CafeMenuSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['category_name'];
   
    if (json['products_id'] != null) {
      products = <CafeItem>[];
      json['products_id'].forEach((v) {
        products!.add(new CafeItem.fromJson(v));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.name;
  
    if (this.products != null) {
      data['products_id'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    return data;
  }
}




