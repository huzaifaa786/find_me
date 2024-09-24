import 'dart:convert';
import 'dart:io';

import 'package:find_me/api/profile_api/profile_api.dart';
import 'package:find_me/models/profile_business_card_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class CreateCardController extends GetxController {
  static CreateCardController instance = Get.find();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController tiktokController = TextEditingController();
  TextEditingController snapchatController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController facebookController = TextEditingController();

  //! Phone Input Field Variable and Validations
  String invalidNumberMessage = '';
  TextEditingController pcontroller = TextEditingController();
  Country? selectedCountry =
      countries.firstWhere((country) => country.fullCountryCode == "92");
  PhoneNumber? checkphoneController;
  String? phoneController;
  UserProfileModel? profileModel;
  ProfileBusinessCardModel? profileBusinessCardModel;
  File? profileImage;

  @override
  void onInit() {
    profileModel ??= Get.arguments[0];
    profileBusinessCardModel ??= Get.arguments[1];

    if (profileBusinessCardModel != null) {
      updateInputs();
    }
    super.onInit();
  }

  updateInputs() {
    firstnameController.text = profileBusinessCardModel?.firstName ?? '';
    lastnameController.text = profileBusinessCardModel?.lastName ?? '';
    companyNameController.text = profileBusinessCardModel?.company ?? '';
    jobTitleController.text = profileBusinessCardModel?.job ?? '';
    emailController.text = profileBusinessCardModel?.email ?? '';
    instagramController.text = profileBusinessCardModel?.instagram ?? '';
    twitterController.text = profileBusinessCardModel?.x ?? '';
    tiktokController.text = profileBusinessCardModel?.tiktok ?? '';
    snapchatController.text = profileBusinessCardModel?.snapchat ?? '';
    facebookController.text = profileBusinessCardModel?.facebook ?? '';
    linkedinController.text = profileBusinessCardModel?.linkedin ?? '';

    if (profileBusinessCardModel?.phone != null) {
      PhoneNumber phoneNumber = PhoneNumber.fromCompleteNumber(
          completeNumber: profileBusinessCardModel!.phone!);
      pcontroller.text = phoneNumber.number;
      phoneController = profileBusinessCardModel?.phone;
      selectedCountry = countries.firstWhere((country) =>
          country.fullCountryCode.toString() ==
          phoneNumber.countryCode.toString());
      update();
    }
    update();
  }

  pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      update();
    }
  }

  bool _validateFields() {
    if (firstnameController.text.isEmpty) {
      UiUtilites.errorSnackbar(
          'Validation Error'.tr, 'First name is required'.tr);
      return false;
    }
    if (lastnameController.text.isEmpty) {
      UiUtilites.errorSnackbar(
          'Validation Error'.tr, 'Last name is required'.tr);
      return false;
    }
    // if (phoneController == null) {
    //   UiUtilites.errorSnackbar(
    //       'Validation Error'.tr, 'Phone number is required'.tr);
    //   return false;
    // }
    // if (emailController.text.isEmpty) {
    //   UiUtilites.errorSnackbar('Validation Error'.tr, 'Email is required'.tr);
    //   return false;
    // }
    return true;
  }

  Future<void> submitBusinessCard() async {
    if (!_validateFields()) {
      return;
    }
    // If image is not null, convert it to base64
    String? base64Image;
    if (profileImage != null) {
      List<int> imageBytes = await profileImage!.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }
    try {
      var response = await ProfileApi.submitBusinessCard(
        userProfileId: profileModel!.id,
        image: base64Image,
        firstName: firstnameController.text,
        lastName: lastnameController.text,
        company: companyNameController.text,
        job: jobTitleController.text,
        phone: phoneController,
        email: emailController.text,
        instagram: instagramController.text,
        x: twitterController.text,
        tiktok: tiktokController.text,
        snapchat: snapchatController.text,
        facebook: facebookController.text,
        linkedin: linkedinController.text,
      );

      if (response.isNotEmpty) {
        if (profileBusinessCardModel == null) {
          UiUtilites.successSnackbar(
              "Business Card Created successfully".tr, "");
          Get.back();
        } else {
          UiUtilites.successSnackbar(
              "Business Card updated successfully".tr, "");
        }
      } else {
        UiUtilites.errorSnackbar(
            'Error'.tr, 'Failed to update Business Card'.tr);
      }
    } catch (e) {
      UiUtilites.errorSnackbar(
          'Error'.tr, 'Failed to update Business Card: $e'.tr);
    }
  }

  Future<void> deleteBusinessCard(int? id) async {
    try {
      var response = await ProfileApi.deleteBusinessCard(id: id);
      if (response.isNotEmpty) {
        Get.back();
        Get.back();
        UiUtilites.successSnackbar("Delete Business Card Successfully", "");
      }
    } catch (e) {
      UiUtilites.errorSnackbar('Error'.tr, 'Failed to update Business Card: $e'.tr);
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
