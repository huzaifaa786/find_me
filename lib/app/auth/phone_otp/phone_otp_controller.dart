import 'package:find_me/api/auth_api/change_phone_api.dart';
import 'package:find_me/api/auth_api/otp_api.dart';
import 'package:find_me/routes/app_routes.dart';
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
    if (response.isNotEmpty) {
      Get.offAndToNamed(AppRoutes.useraccount);
      UiUtilites.successGreenAlert(Get.context,
          text: "Your phone number has been updated \n successfully",
          onTapDone: () {
        Get.back();
      });
    } else {
      UiUtilites.errorSnackbar("Error!".tr, "Phone number was not updated".tr);
    }
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
        UiUtilites.successSnackbar("OTP sent".tr, "OTP sent successfully".tr);
      }
    }
  }
}
