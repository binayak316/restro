
import 'package:restro_management_sys/core/model/user_model.dart';

List<MyReserveTable> myReservedTableFromJson(List<dynamic> mytablesJson) =>
    List<MyReserveTable>.from(
      mytablesJson.map(
        (mytableJson) => MyReserveTable.fromJson(mytableJson),
      ),
    );

class MyReserveTable {
  int? id;
  int? userId;
  int? tableId;
  String? date;
  String? time;
  int? guestCount;
  int? isComplete;
  String? createdAt;
  String? updatedAt;
  User? user;
  Table? table;

  MyReserveTable(
      {this.id,
      this.userId,
      this.tableId,
      this.date,
      this.time,
      this.guestCount,
      this.isComplete,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.table});

  MyReserveTable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tableId = json['table_id'];
    date = json['date'];
    time = json['time'];
    guestCount = json['guest_count'];
    isComplete = json['is_complete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['table_id'] = this.tableId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['guest_count'] = this.guestCount;
    data['is_complete'] = this.isComplete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
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
