// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:find_me/models/user_model.dart';

class NotificationModel {
  int? id;
  int? sender_profile_id;
  int? receiver_profile_id;
  int? profile_request_id;
  int? orderid;
  String? title;
  String? body;
  String? arbody;
  // int? seen;
  String? created_at;
  String? updated_at;
  UserModel? user;

  NotificationModel(
      {this.id,
      this.arbody,
      this.body,
      this.orderid,
      this.title,
      // this.seen,
      this.receiver_profile_id,
      this.sender_profile_id,
      this.profile_request_id,
      this.created_at,
      this.updated_at,
      this.user});

  factory NotificationModel.fromjson(Map<String, dynamic> json) {
    //* Converting DateTime object to the desired date format
    DateTime now = DateTime.now();
    String originalString = json['created_at'].toString();
    DateTime dateTime = DateTime.parse(originalString);
    String? formattedDate;
    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      formattedDate = DateFormat('hh:mm a').format(dateTime);
    } else {
      formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    }
    //
    Map<String, dynamic>? userJson = json['user'] as Map<String, dynamic>?;
    UserModel? user = userJson != null ? UserModel.fromJson(userJson) : null;
    //
    return NotificationModel(
      id: json['id'],
      arbody: json['ar_body'],
      body: json['body'],
      orderid: json['order_id'],
      sender_profile_id: json['user_id'],
      receiver_profile_id: json['partner_id'],
      // seen: json['seen'],
      title: json['title'],
      created_at: formattedDate,
      updated_at: formattedDate,
      user: user,
    );
  }
}
