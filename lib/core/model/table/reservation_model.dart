class Reservation {
  int? id;
  int? userId;
  int? tableId;
  String? date;
  String? time;
  int? guestCount;
  int? isComplete;
  String? createdAt;
  String? updatedAt;

  Reservation(
      {this.id,
      this.userId,
      this.tableId,
      this.date,
      this.time,
      this.guestCount,
      this.isComplete,
      this.createdAt,
      this.updatedAt});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tableId = json['table_id'];
    date = json['date'];
    time = json['time'];
    guestCount = json['guest_count'];
    isComplete = json['is_complete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
