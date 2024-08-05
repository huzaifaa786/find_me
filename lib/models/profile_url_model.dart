
class ProfileUrlModel {
  int id;
  int userProfileId;
  String? whatsapp;
  String? instagram;
  String? tiktok;
  String? x;
  String? telegram;
  String? snapchat;
  String? facebook;
  String? youtube;
  String? email;
  String? linkedin;

  ProfileUrlModel({
    required this.id,
    required this.userProfileId,
    this.whatsapp,
    this.instagram,
    this.tiktok,
    this.x,
    this.telegram,
    this.snapchat,
    this.facebook,
    this.youtube,
    this.email,
    this.linkedin,
  });

  factory ProfileUrlModel.fromJson(Map<String, dynamic> json) {
    return ProfileUrlModel(
      id: json['id'],
      userProfileId: json['user_profile_id'],
      whatsapp: json['whatsapp'],
      instagram: json['instagram'],
      tiktok: json['tiktok'],
      x: json['x'],
      telegram: json['telegram'],
      snapchat: json['snapchat'],
      facebook: json['facebook'],
      youtube: json['youtube'],
      email: json['email'],
      linkedin: json['linkedin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_profile_id': userProfileId,
      'whatsapp': whatsapp,
      'instagram': instagram,
      'tiktok': tiktok,
      'x': x,
      'telegram': telegram,
      'snapchat': snapchat,
      'facebook': facebook,
      'youtube': youtube,
      'email': email,
      'linkedin': linkedin,
    };
  }
}
