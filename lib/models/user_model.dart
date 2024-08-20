import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/models/user_wallet_model.dart';

class UserModel {
  int id;
  String? firstName;
  String? lastName;
  String? gender;
  String? name;
  String? email;
  String? phone;
  String? dob;
  String? beaconId;
  String? loginType;

  UserProfileModel? currentProfile;
  List<UserProfileModel>? profiles;
  UserWalletModel? wallet;

  UserModel({
    required this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.beaconId,
    this.dob,
    this.loginType,
    this.currentProfile,
    this.profiles,
    this.wallet,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var profileList = (json['profiles'] as List)
        .map((profileJson) => UserProfileModel.fromJson(profileJson))
        .toList();
    return UserModel(
        id: json['id'],
        name: json['name'] ,
        firstName: json['first_name'] ,
        lastName: json['last_name'] ,
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        beaconId: json['beacon_id'],
        dob: json['dob'],
        loginType: json['login_type'],
        currentProfile: json['current_profile'] != null
            ? UserProfileModel.fromJson(json['current_profile'])
            : null,
        profiles: profileList,
        wallet: json['wallet'] != null
            ? UserWalletModel.fromJson(json['wallet'])
            : null);
  }
}
