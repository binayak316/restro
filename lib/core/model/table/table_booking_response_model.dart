class TableBookingResponseModel {
  int? userId;
  int? tableId;
  String? date;
  String? time;
  int? guestCount;
  String? updatedAt;
  String? createdAt;
  int? id;

  TableBookingResponseModel(
      {this.userId,
      this.tableId,
      this.date,
      this.time,
      this.guestCount,
      this.updatedAt,
      this.createdAt,
      this.id});

  TableBookingResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    tableId = json['table_id'];
    date = json['date'];
    time = json['time'];
    guestCount = json['guest_count'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
