import 'package:find_me/models/emoji_model.dart';
import 'package:find_me/models/profile_business_card_model.dart';
import 'package:find_me/models/profile_url_model.dart';
import 'package:find_me/models/user_model.dart';

class UserProfileModel {
  int id;
  String? name;
  String? bio;
  String? imageUrl;
  String? types;
  String? username;
  ProfileUrlModel? urls;
  bool isVerified;
  bool isProfilePublic;
  bool isSocialPublic;
  ProfileBusinessCardModel? businessCard;
  List<EmojiModel>? emojis;
  int userId;
  int? nameChangedDays;

  UserProfileModel({
    required this.id,
    this.name,
    this.bio,
    this.imageUrl,
    this.username,
    this.urls,
    this.types,
    this.businessCard,
    this.emojis,
    this.nameChangedDays,
    required this.isVerified,
    required this.isProfilePublic,
    required this.isSocialPublic,
    required this.userId,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
        id: json['id'],
        name: json['name'] ?? '',
        imageUrl: json['image'],
        username: json['username'] ?? '',
        nameChangedDays: json['days_since_name_change'],
        bio: json['bio'] ?? '',
        urls: json['urls'] != null
            ? ProfileUrlModel.fromJson(json['urls'])
            : null,
        isVerified: json['profile_verified'] == 1 ? true : false,
        isProfilePublic: json['public_profile'] == 1 ? true : false,
        isSocialPublic: json['public_social'] == 1 ? true : false,
        businessCard: json['business_card'] != null
            ? ProfileBusinessCardModel.fromJson(json['business_card'])
            : null,
        emojis: json['emojis_with_count'] != null
            ? List.from(json['emojis_with_count'])
                .map((emoji) =>
                    EmojiModel.fromJson(emoji as Map<String, dynamic>))
                .toList()
            : [],
        userId: json['user_id']);
  }
}
