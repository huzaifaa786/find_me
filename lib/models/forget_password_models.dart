class ForgotPasswordResponse {
  String? otp;
  bool? error;
  String? error_data;
  String? type;

  ForgotPasswordResponse({
    this.otp,
    this.error,
    this.error_data,
    this.type,

  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      otp: json['otp'],
      error: json['error'] ,
      error_data: json['error_data'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'true': error,
      "error_data": error_data,
      "type":type,
    };
  }
}
