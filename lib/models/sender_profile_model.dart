// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

class SenderProfileModel {
  int? id;
  String? name;
  int? user_id;
  String? username;
  String? bio;
  String? image;
  // String? urls;
  // String? business_card;
  // List<String>? emojisWithCount;
  // Bool? profile_verified;
  // Bool? public_profile;
  // Bool? public_social;

  SenderProfileModel({
    this.id,
    this.name,
    this.user_id,
    this.username,
    this.bio,
    required this.image,
    // this.urls,
    // this.business_card,
    // required this.emojisWithCount,
    // required this.profile_verified,
    // required this.public_profile,
    // required this.public_social,
  });

  factory SenderProfileModel.fromjson(Map<String, dynamic> json) {
    return SenderProfileModel(
      id: json['id'],
      name: json['name'],
      user_id: json['user_id'],
      username: json['username'],
      bio: json['bio'],
      image: json['image'],
      // urls: json['urls'],
      // business_card: json['business_card'],
      // emojisWithCount: List<String>.from(json['emojis_with_count'] ?? []),
      // profile_verified: json['profile_verified']?? '',
      // public_profile: json['public_profile'],
      // public_social: json['public_social'],
    );
  }
}
