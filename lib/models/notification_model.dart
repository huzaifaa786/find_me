// import 'package:intl/intl.dart';
// import 'package:find_me/models/user_model.dart';

// class NotificationModel {
//   int? id;
//   int? userid;
//   int? partnerid;
//   int? orderid;
//   String? title;
//   String? body;
//   String? arbody;
//   int? seen;
//   String? date;
//   UserModel? user;

//   NotificationModel(
//       {this.id,
//       this.arbody,
//       this.body,
//       this.date,
//       this.orderid,
//       this.title,
//       this.partnerid,
//       this.seen,
//       this.userid,this.user});


//   factory NotificationModel.fromjson(Map<String, dynamic> json) {
//       //* Converting DateTime object to the desired date format
//     DateTime now = DateTime.now();
//     String originalString = json['created_at'].toString();
//     DateTime dateTime = DateTime.parse(originalString);
//     String? formattedDate;
//     if (dateTime.year == now.year &&
//         dateTime.month == now.month &&
//         dateTime.day == now.day) {
//       formattedDate = DateFormat('hh:mm a').format(dateTime);
//     } else {
//       formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
//     }
//     //
//  Map<String, dynamic>? userJson = json['user'] as Map<String, dynamic>?;
//     UserModel? user = userJson != null ? UserModel.fromJson(userJson) : null;
//     //
//     return NotificationModel(
//       id: json['id'],
//       arbody: json['ar_body'],
//       body: json['body'],
//       userid: json['user_id'],
//       orderid: json['order_id'],
//       partnerid: json['partner_id'],
//       seen: json['seen'],
//       title: json['title'],
//       date: formattedDate,
// user: user,
//     );
//   }
// }
