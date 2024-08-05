class ProfileBusinessCardModel {
  int id;
  int? userProfileId;
  String? image;
  String? firstName;
  String? lastName;
  String? company;
  String? job;
  String? phone;
  String? email;
  String? instagram;
  String? x;
  String? tiktok;
  String? snapchat;
  String? facebook;
  String? linkedin;

  ProfileBusinessCardModel({
    required this.id,
    this.userProfileId,
    this.image,
    this.firstName,
    this.lastName,
    this.company,
    this.job,
    this.phone,
    this.email,
    this.instagram,
    this.x,
    this.tiktok,
    this.snapchat,
    this.facebook,
    this.linkedin,

  });

  factory ProfileBusinessCardModel.fromJson(Map<String, dynamic> json) {
    return ProfileBusinessCardModel(
      id: json['id'],
      userProfileId: json['user_profile_id'],
      image: json['image'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      company: json['company'],
      job: json['job'],
      phone: json['phone'],
      email: json['email'],
      instagram: json['instagram'],
      x: json['x'],
      tiktok: json['tiktok'],
      snapchat: json['snapchat'],
      facebook: json['facebook'],
      linkedin: json['linkedin'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_profile_id': userProfileId,
      'image': image,
      'first_name': firstName,
      'last_name': lastName,
      'company': company,
      'job': job,
      'phone': phone,
      'email': email,
      'instagram': instagram,
      'x': x,
      'tiktok': tiktok,
      'snapchat': snapchat,
      'facebook': facebook,
      'linkedin': linkedin,
    };
  }
}
