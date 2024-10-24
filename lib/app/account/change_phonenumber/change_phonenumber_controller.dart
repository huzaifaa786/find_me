import 'package:find_me/api/auth_api/change_phone_api.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class ChangePhoneNumberController extends GetxController {
  static ChangePhoneNumberController instance = Get.find();

  //! Phone Input Field Variable and Validations
  String invalidNumberMessage = '';
  TextEditingController pcontroller = TextEditingController();
  Country? selectedCountry =
      countries.firstWhere((country) => country.fullCountryCode == "971");
  PhoneNumber? checkphoneController;
  String? phoneController;

  @override
  void onClose() {
    pcontroller.clear();
    super.onClose();
  }

  void updatePhone() async {
    if (phoneController != null) {
      var response = await ChangePhoneApi.changePhone(phoneController!);
      if (response.isNotEmpty) {
        UiUtilites.successSnackbar("OTP sent successfully".tr, "Success".tr);
        Get.toNamed(AppRoutes.phoneOtp, arguments: phoneController);
      }
    } else {
      UiUtilites.errorSnackbar("error".tr, "Phone can't be empty".tr);
    }
  }

  onCountryChanged(Country value) {
    selectedCountry = value;
    pcontroller.clear();
    update();
    if (checkphoneController != null) phoneValidation(checkphoneController);
  }

  phoneValidation(phone) {
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
            .firstWhere((element) => element.code == phone!.countryISOCode)
            .maxLength ==
        phone!.number.length) {
      phoneController = phone.completeNumber;
      update();
    } else {
      phoneController = null;
    }
    return invalidNumberMessage;
  }
}
