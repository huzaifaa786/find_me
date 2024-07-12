class ForgotPasswordResponse {
  String? otp;
  bool? error;
  String? error_data;

  ForgotPasswordResponse({
     
    this.otp,
    this.error,
    this.error_data,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
     
      otp: json['OTP sent successfully'],
      error: json['true']?? false,
      error_data: json['error_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'OTP sent successfully': otp,
      'true': error,
      "Account does not exist": error_data,
    };
  }
}
