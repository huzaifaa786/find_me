import 'package:find_me/api/auth_api.dart/change_email_api.dart';
import 'package:find_me/api/auth_api.dart/otp_api.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EmailOtpController extends GetxController {
  static EmailOtpController instance = Get.find();

  String otpCode = '';
  String verificationId = '';
  String? email;
  GetStorage box = GetStorage();
  bool areFieldsFilled = false;

  @override
  void onInit() {
    email ??= Get.arguments;
    super.onInit();
  }

  void verifyOtp() async {
    var response = await OtpApi.verifyEmailOtp(email: email, otp: otpCode);
    if (response.isNotEmpty) {}
  }

  void setOtpCode(String code) {
    otpCode = code;
    areFieldsFilled = otpCode.length == 6;
    update();
  }

  void resendOtp() async {
    if (email != null) {
      var response = await ChangeEmailApi.changeEmail(email!);
      if (response.isNotEmpty) {
        UiUtilites.successSnackbar("Otp sent", "Otp Sent Successfully");
      }
    }
  }
}
