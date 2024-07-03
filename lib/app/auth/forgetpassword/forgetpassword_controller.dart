import 'package:find_me/api/auth_api.dart/forgetpassword_api.dart';

import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
// Assume this contains Country model and list of countries

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController instance = Get.find();

  TextEditingController phonenumberController = TextEditingController();
  bool isCodeEntered = false;
  String otp = '';

  // Phone Input Field Variables and Validations
  String? completePhone;
  String phone = '';
  bool isCompleteNumber = false;

  String invalidNumberMessage = '';
  TextEditingController pcontroller = TextEditingController();
  Country? selectedCountry =
      countries.firstWhere((country) => country.fullCountryCode == "971");
  PhoneNumber? checkphoneController;
  String? phoneController;

  void onCountryChanged(Country value) {
    selectedCountry = value;
    pcontroller.clear();
    update();
    if (checkphoneController != null) {
      phoneValidation(checkphoneController!);
    }
  }

  String phoneValidation(phone) {
    if (!isNumeric(phone.number)) {
      invalidNumberMessage = 'Use Numeric Variables';
      update();
      return invalidNumberMessage;
    } else if (phone.number.length < selectedCountry!.minLength ||
        phone.number.length > selectedCountry!.maxLength) {
      invalidNumberMessage = 'Invalid Phone Number';
      update();
      return invalidNumberMessage;
    } else {
      invalidNumberMessage = '';
    }
    checkphoneController = phone;
    update();

    if (countries
            .firstWhere((element) => element.code == phone.countryISOCode)
            .maxLength ==
        phone.number.length) {
      phoneController = phone.completeNumber;
      update();
    } else {
      phoneController = null;
    }
    return invalidNumberMessage;
  }

  Future<void> forgetPasswordUser() async {
    if (phoneController == null) {
      UiUtilites.errorSnackbar('Error'.tr, 'Invalid phone number.');
      return;
    }

    Map<String, dynamic> response =
        await ForgotPasswordApi.forgotpassword(phone: phoneController!);
    if (response.isNotEmpty) {
      isCodeEntered = true;
      update();
      Get.offAllNamed(AppRoutes.otp, arguments: phoneController);
    } else {
      UiUtilites.errorSnackbar('Error'.tr, 'Failed to send OTP');
      update();
    }
  }

  void verifyOtp() async {
    if (otp.length < 6) {
      UiUtilites.errorSnackbar('Error'.tr, 'Fill out complete OTP.'.tr);
      return;
    }
    var response = await ForgotPasswordApi.verifyotp(otp: otp);
    if (response.isNotEmpty) {
      Get.toNamed(AppRoutes.changepassword,
          parameters: {'email': phonenumberController.text});
      UiUtilites.successSnackbar('Verification successful'.tr, 'Success'.tr);
    } else {
      UiUtilites.errorSnackbar('Error'.tr, 'Verification failed');
    }
  }
}
