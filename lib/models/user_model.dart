class UserModel {
  int id;
  String? name;
  String? email;
  String? login_type;
   String? account_type;
  String? api_token;
  String? phone;
  

  UserModel({
    required this.id,
     this.name,
     this.email,
     this.login_type,
     this.account_type,
     this.api_token,
     this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ??'',
      email: json['email'],
      login_type: json['login_type'],
      account_type: json['login_type'],
      api_token: json['token'],
      phone: json['phone'],

    );
  }
}
