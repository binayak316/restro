
import 'package:restro_management_sys/core/model/table/reservation_model.dart';

List<TableModelModel> tableFromJson(List<dynamic> tablesJson) =>
    List<TableModelModel>.from(
      tablesJson.map(
        (tableJson) => TableModelModel.fromJson(tableJson),
      ),
    );

class TableModelModel {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;
  Reservation? reservation;

  TableModelModel({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.reservation,
  });

  TableModelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    reservation = json['reservation'] != null
        ? Reservation.fromJson(json['reservation'])
        : null;
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
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.toJson();
    }
    return data;
  }
}
