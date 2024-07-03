class UpdatePasswordResponse {
 String? otp;
  bool? error;
  String? error_data;

 UpdatePasswordResponse({
     
    this.otp,
    this.error,
    this.error_data,
  });

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordResponse(
     
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
