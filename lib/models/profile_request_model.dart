import 'package:find_me/app/edit_profile/edit_profile_controller.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/models/user_wallet_model.dart';

class ProfileRequestModel {
  int id;
  UserProfileModel? senderProfile;
  UserProfileModel? receiverProfile;
  String? requestType;
  String? status;

  ProfileRequestModel({
    required this.id,
    this.receiverProfile,
    this.senderProfile,
    this.requestType,
    this.status,
  });

  factory ProfileRequestModel.fromJson(Map<String, dynamic> json) {

    return ProfileRequestModel(
      id: json['id'],
      requestType: json['request_type'],
      status: json['status'],
      senderProfile: json['sender_profile'] != null
          ? UserProfileModel.fromJson(json['sender_profile'])
          : null,
      receiverProfile: json['receiver_profile'] != null
          ? UserProfileModel.fromJson(json['receiver_profile'])
          : null,
    );
  }
}
