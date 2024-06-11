import 'package:find_me/components/helper/loading.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  static OtpController instance = Get.find();
  String otpCode = '';
  String language = 'english';
  bool isCompleteNumber = false;
  String phone = '';
  String verificationId = '';
  bool isSelected = false;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //----------------otp sign-up/ sign-in--------
  RxString? last2;
  String? completePhone;
  int? resendtoken;
  String verificationid = "";
  RxBool areFieldsFilled = false.obs;
  String usersCollection = "users";

  void verifyOtpCode() async {
    LoadingHelper.show();
    // try {
    //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: verificationid,
    //     smsCode: otpCode,
    //   );
    //   await auth.signInWithCredential(credential);
    //   // var response =
    //   //     await phoneOtpApi.registerUserWithOtp(phone: completePhone);
    //   // if (response.isNotEmpty) {
    //   //   // box.write('api_token', response['user']['token']);
    //   //   // Get.offAllNamed(AppRoutes.mainview);
    //   // }
    //   LoadingHelper.dismiss();
    //   // UiUtilites.successSnackbar('OTP verified successfully'.tr, 'Success!'.tr);
    //   // Navigate to the home screen or wherever needed
    // } catch (e) {
    //   LoadingHelper.dismiss();
    //   Get.snackbar(
    //     'Verification failed'.tr,
    //     e.toString(),
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: AppColors.red,
    //     colorText: AppColors.white,
    //   );
    // }
  }
}
