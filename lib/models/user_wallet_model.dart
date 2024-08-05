class UserWalletModel {
  int id;
  int? userId;
  int? coins;

  UserWalletModel({
    required this.id,
    this.userId,
    this.coins,
  });

  factory UserWalletModel.fromJson(Map<String, dynamic> json) {
    return UserWalletModel(
      id: json['id'],
      userId: json['user_id'],
      coins: json['coins'],
    );
  }
}
