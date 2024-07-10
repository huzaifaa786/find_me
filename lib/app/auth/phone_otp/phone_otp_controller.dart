import 'package:find_me/api/auth_api.dart/change_email_api.dart';
import 'package:find_me/api/auth_api.dart/change_phone_api.dart';
import 'package:find_me/api/auth_api.dart/otp_api.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PhoneOtpController extends GetxController {
  static PhoneOtpController instance = Get.find();

  String otpCode = '';
  String verificationId = '';
  String? phone;
  GetStorage box = GetStorage();
  bool areFieldsFilled = false;

  @override
  void onInit() {
    phone ??= Get.arguments;
    super.onInit();
  }

  void verifyOtp() async {
    var response = await OtpApi.verifyPhoneOtp(phone: phone, otp: otpCode);
    if (response.isNotEmpty) {}
  }

  void setOtpCode(String code) {
    otpCode = code;
    areFieldsFilled = otpCode.length == 6;
    update();
  }

  void resendOtp() async {
    if (phone != null) {
      var response = await ChangePhoneApi.changePhone(phone!);
      if (response.isNotEmpty) {
        UiUtilites.successSnackbar("Otp sent", "Otp Sent Successfully");
      }
    }
  }
}
