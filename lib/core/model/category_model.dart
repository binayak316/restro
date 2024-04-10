List<MenuCategory> categoriesFromJson(List<dynamic> categoriesJson) =>
    List<MenuCategory>.from(
      categoriesJson.map(
        (categoryJson) => MenuCategory.fromJson(categoryJson),
      ),
    );

class MenuCategory{
  int? id;
  String? name;
  int? imageId;
  String? createdAt;
  String? updatedAt;
  String? image;

  MenuCategory(
      {this.id,
      this.name,
      this.imageId,
      this.createdAt,
      this.updatedAt,
      this.image});

  MenuCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageId = json['image_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_id'] = this.imageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}
