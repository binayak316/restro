class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? role;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.role,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = email;
    data['role'] = phone;

    return data;
  }
}
