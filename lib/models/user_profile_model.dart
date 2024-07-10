import 'package:find_me/models/profile_business_card_model.dart';
import 'package:find_me/models/profile_url_model.dart';

class UserProfileModel {
  int id;
  String? name;
  String? bio;
  String? imageUrl;
  String? username;
  ProfileUrlModel? urls;
  ProfileBusinessCardModel? businessCard;

  UserProfileModel({
    required this.id,
    this.name,
    this.bio,
    this.imageUrl,
    this.username,
    this.urls,
    this.businessCard,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
        id: json['id'],
        name: json['name'] ?? '',
        imageUrl: json['image'] ??
            'https://avatar.iran.liara.run/public/boy?username=${json['name']}',
        username: json['username'] ?? '',
        bio: json['bio'] ?? '',
        urls: json['urls'] != null
            ? ProfileUrlModel.fromJson(json['urls'])
            : null,
        businessCard: json['business_card'] != null
            ? ProfileBusinessCardModel.fromJson(json['business_card'])
            : null);
  }
}
