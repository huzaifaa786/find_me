import 'package:find_me/models/profile_business_card_model.dart';
import 'package:find_me/models/profile_url_model.dart';

class UserProfileModel {
  int id;
  String? name;
  String? bio;
  String? imageUrl;
  String? username;
  ProfileUrlModel? urls;
  bool isVerified;
  ProfileBusinessCardModel? businessCard;

  UserProfileModel({
    required this.id,
    this.name,
    this.bio,
    this.imageUrl,
    this.username,
    this.urls,
    this.businessCard,
    required this.isVerified,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
        id: json['id'],
        name: json['name'] ?? '',
        imageUrl: json['image'],
        username: json['username'] ?? '',
        bio: json['bio'] ?? '',
        urls: json['urls'] != null
            ? ProfileUrlModel.fromJson(json['urls'])
            : null,
        isVerified: json['profile_verified'] == 1 ? true : false,
        businessCard: json['business_card'] != null
            ? ProfileBusinessCardModel.fromJson(json['business_card'])
            : null);
  }
}
