class VerifyOtpResponse {
String? otp;
  bool? error;
  String? error_data;
  String? type;

 VerifyOtpResponse({
     this.type,
    this.otp,
    this.error,
    this.error_data,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
     
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
