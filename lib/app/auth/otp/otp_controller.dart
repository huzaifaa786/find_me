import 'package:find_me/api/auth_api/otp_api.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OtpController extends GetxController {
  static OtpController instance = Get.find();
  String otpCode = '';
  String language = 'english';
  bool isCompleteNumber = false;
  String? phone;
  String verificationId = '';
  bool isSelected = false;
  GetStorage box = GetStorage();

  bool areFieldsFilled = false;

  @override
  void onInit() {
    phone ??= Get.arguments;
    super.onInit();
  }

  void verifyOtp() async {
    var response = await OtpApi.verifyOtp(phone: phone, otp: otpCode);
    if (response.isNotEmpty) {
      box.write('api_token', response['user']['token']);
      box.write('beacon_id', response['user']['beacon_id']);
      Get.offAllNamed(AppRoutes.mainview);
    }
  }

  void setOtpCode(String code) {
    otpCode = code;
    areFieldsFilled = otpCode.length == 6;
    update();
  }

  void resendOtp() async {
    if (phone != null) {
      var response = await OtpApi.sendOtp(phone: phone);
      if (response.isNotEmpty) {
        UiUtilites.successSnackbar("Otp sent".tr, response['message']);
        print("Otp sent successfully".tr);
      }
    }
  }
}
