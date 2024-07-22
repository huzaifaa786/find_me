import 'package:find_me/api/auth_api/change_email_api.dart';
import 'package:find_me/api/auth_api/change_phone_api.dart';
import 'package:find_me/api/auth_api/forgetpassword_api.dart';
import 'package:find_me/api/auth_api/otp_api.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ForgetPasswordOtpController extends GetxController {
  static ForgetPasswordOtpController instance = Get.find();
  String otpCode = '';
  String? type;
  String? phone;
  String? email;
  GetStorage box = GetStorage();
  bool areFieldsFilled = false;

  @override
  void onInit() {
    super.onInit();
    type = Get.arguments['type'];
    phone = Get.arguments['phone'];
    email = Get.arguments['email'];
    print(type);
    print(phone);
    print(email);
  }

  void setOtpCode(String code) {
    otpCode = code;
    areFieldsFilled = otpCode.length == 6;
    update();
  }

  void resendOtpEmail() async {
    var response =
        await ForgotPasswordApi.forgotpassword(type: type, email: email);
    if (response.isNotEmpty) {
      UiUtilites.successSnackbar("Otp sent", "Otp Sent Successfully");
    }
  }

  verifyOtp() async {
    if (otpCode.length < 6) {
      Fluttertoast.showToast(msg: 'Fill out complete otp.'.tr);
      return;
    }
    var response = await ForgotPasswordApi.verifyOtp(
        otp: otpCode, type: type, email: email, phone: phone);
    if (response.isNotEmpty) {
      Get.toNamed(
        AppRoutes.new_password,
        arguments: {
          'type': type,
          'phone': phone,
          'email': email,
        },
      );

      UiUtilites.successSnackbar('verification successfully'.tr, 'Success'.tr);
    } else {
      UiUtilites.errorSnackbar('Error'.tr, response['error_data'.tr]);
    }
  }

  void resendOtpPhone() async {
    var response =
        await ForgotPasswordApi.forgotpassword(type: type, phone: phone);
    if (response.isNotEmpty) {
      UiUtilites.successSnackbar("Otp sent", "Otp Sent Successfully");
    } else {
      UiUtilites.successSnackbar(
          "Otp sent fail ", "Otp Sent  not Successfully");
    }
  }
}
