class VerifyOtpResponse {
String? otp;
  bool? error;
  String? error_data;

 VerifyOtpResponse({
     
    this.otp,
    this.error,
    this.error_data,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
     
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
