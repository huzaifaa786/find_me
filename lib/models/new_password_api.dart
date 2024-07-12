class NewPassword {
  String? type;
  String? email;
  String? phone;
  String? password;

  NewPassword({
    this.type,
    this.email,
    this.phone,
    this.password,
  });

  factory NewPassword.fromJson(Map<String, dynamic> json) {
    return NewPassword(
      type: json['type'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
       "type": type,
      'email': email,
      "phone": phone,
      "password": password,

     
    };
  }
}
