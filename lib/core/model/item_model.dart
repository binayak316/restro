import 'package:restro_management_sys/core/model/category_model.dart';

List<CafeItem> itemsFromJson(List<dynamic> itemsJson) => List<CafeItem>.from(
      itemsJson.map(
        (itemJson) => CafeItem.fromJson(itemJson),
      ),
    );

class CafeItem {
  int? id;
  String? name;
  String? price;
  String? description;
  int? imageId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  // String? image;
  ImageModel? imageModel;
  MenuCategory? category;

  CafeItem({
    this.id,
    this.name,
    this.price,
    this.description,
    this.imageId,
    this.categoryId,
    this.createdAt,
    this.imageModel,
    this.updatedAt,
    this.category,
  });

  CafeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    imageId = json['image_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // image = json['image'];
    imageModel =
        json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    category = json['category'] != null
        ? MenuCategory.fromJson(json['category'])
        : null;
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
    // data['image'] = this.image;
    if (this.imageModel != null) {
      data['image'] = this.imageModel!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ImageModel {
  int? id;
  String? fileTitle;
  String? fileName;
  String? createdAt;
  String? updatedAt;

  ImageModel(
      {this.id, this.fileTitle, this.fileName, this.createdAt, this.updatedAt});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileTitle = json['file_title'];
    fileName = json['file_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_title'] = this.fileTitle;
    data['file_name'] = this.fileName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
