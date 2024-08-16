import 'package:find_me/api/auth_api/change_email_api.dart';
import 'package:find_me/api/auth_api/forgetpassword_api.dart';
import 'package:find_me/api/auth_api/otp_api.dart';
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
  String? type;
  String? phone;
  GetStorage box = GetStorage();
  bool areFieldsFilled = false;

  @override
  void onInit() {
    type = Get.parameters['type'];
    phone = Get.parameters['phone'];
    email ??= Get.arguments;
    super.onInit();
  }

  void verifyOtp() async {
    var response = await OtpApi.verifyEmailOtp(email: email, otp: otpCode);
    if (response.isNotEmpty) {
      Get.offAndToNamed(AppRoutes.useraccount);
      UiUtilites.registerSuccessAlert(
          Get.context, "Your email has been changed successfully!".tr);
    }
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
        UiUtilites.successSnackbar("Otp sent".tr, "Otp Sent Successfully".tr);
      }
    }
  }
}
