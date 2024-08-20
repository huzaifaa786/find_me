import 'package:find_me/api/auth_api/forgetpassword_api.dart';
import 'package:find_me/helpers/validator.dart';

import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController instance = Get.find();

  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String emailError = '';
  bool isCodeEntered = false;
  String otp = '';
  String type = 'email';
  Future<void> forgetPasswordUserEmail() async {
    if (emailController.text.isEmpty) {
      UiUtilites.errorSnackbar('Error'.tr, 'Email cannot be empty'.tr);
      return;
    }
    var response = await ForgotPasswordApi.forgotpassword(
        type: 'email', email: emailController.text);
    if (response.isNotEmpty) {
      isCodeEntered = true;
      update();
      Get.toNamed(AppRoutes.forgetpassword_otp,
           arguments: {
                'type': type,
                'email': emailController.text,
              },);
    } else {
      UiUtilites.errorSnackbar('Error'.tr, 'Failed to send OTP'.tr);
      update();
    }
  }

  // TODO: Email Validation
  String emailValidation(String i) {
    final validationError = Validators.emailValidator(i);
    if (validationError != null) {
      emailError = validationError.toString();
      update();
      return emailError;
    }
    emailError = '';
    update();
    return emailError;
  }

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
      invalidNumberMessage = 'Use Numeric Variables'.tr;
      update();
      return invalidNumberMessage;
    } else if (phone.number.length < selectedCountry!.minLength ||
        phone.number.length > selectedCountry!.maxLength) {
      invalidNumberMessage = 'Invalid Phone Number'.tr;
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
      UiUtilites.errorSnackbar('Error'.tr, 'Invalid phone number.'.tr);
      return;
    }
    type = 'phone';
    Map<String, dynamic> response = await ForgotPasswordApi.forgotpassword(
        type: 'phone', phone: phoneController!);

    if (response.isNotEmpty) {
      isCodeEntered = true;
      update();
      Get.toNamed(
        AppRoutes.forgetpassword_otp,
       arguments: {
                'type': type,
                'phone': phoneController,
               
              },
        
      );
    } else {
      UiUtilites.errorSnackbar('Error'.tr, 'Failed to send OTP'.tr);
      update();
    }
  }
}
