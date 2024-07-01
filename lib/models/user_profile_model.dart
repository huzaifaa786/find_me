class UserProfileModel {
  int id;
  String? name;
  String? bio;
  String? imageUrl;
  String? username;


  UserProfileModel({
    required this.id,
    this.name,
    this.bio,
    this.imageUrl,
    this.username,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      name: json['name'] ?? '',
      imageUrl: json['image'],
      username: json['username'] ?? '',
      bio: json['bio'] ?? '',
    );
  }
}
