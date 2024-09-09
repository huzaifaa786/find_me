class NotificationPermissionModel {
  int id;
  int? profileId;
  bool? emoji;
  bool? profile;
  bool? social;

  NotificationPermissionModel({
    required this.id,
    this.profileId,
    this.emoji,
    this.profile,
    this.social,
  });

  factory NotificationPermissionModel.fromJson(Map<String, dynamic> json) {
    return NotificationPermissionModel(
      id: json['id'],
      profileId: json['user_profile_id'],
      emoji: json['emoji'] == 1 || json['emoji'] == true ? true:false,
      profile: json['profile'] == 1 || json['profile'] == true ? true:false,
      social: json['social'] == 1 || json['social'] == true ? true:false,
    );
  }
}
