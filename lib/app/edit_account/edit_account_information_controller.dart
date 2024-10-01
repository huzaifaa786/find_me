import 'dart:developer';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/change_information/change_information_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditAccountInformationController extends GetxController {
  static EditAccountInformationController instance = Get.find();
  UserModel? userModel;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String? gender = "";
  String? firstname;
  String? lastname;
  String? Birthday;

  //! Date of Birth Selection
  final dateController = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  final DateTime now = DateTime.now();
  final DateTime maxDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final DateTime minDate = DateTime(
      DateTime.now().year - 100, DateTime.now().month, DateTime.now().day);
  DateTime initialDate = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

  Future<void> selectDate(BuildContext context) async {
    final DateTime firstDate = DateTime(now.year - 100, now.month, now.day);
    final DateTime lastDate = DateTime(now.year - 10, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
      dateController.text = formattedDate;
      dayController.text = picked.day.toString().padLeft(2, '0');
      monthController.text = picked.month.toString().padLeft(2, '0');
      yearController.text = picked.year.toString();
    }
  }

  void openDatePicker(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text(
        'Set your Birthday',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: AppColors.primary_color,
        ),
      ),
      titlePadding: EdgeInsets.only(bottom: 10),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: initialDate,
      maxDateTime: maxDate,
      minDateTime: minDate,
      pickerTextStyle: TextStyle(
        color: AppColors.primary_color,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      onChange: (picked) {
        String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
        dateController.text = formattedDate; // Update the dateController
        dayController.text = picked.day.toString().padLeft(2, '0');
        monthController.text = picked.month.toString().padLeft(2, '0');
        yearController.text = picked.year.toString();
      },
      onSubmit: (picked) {
        String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
        dateController.text = formattedDate; // Update the dateController
        dayController.text = picked.day.toString().padLeft(2, '0');
        monthController.text = picked.month.toString().padLeft(2, '0');
        yearController.text = picked.year.toString();
      },
      bottomPickerTheme: BottomPickerTheme.blue,
    ).show(context);
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void handleGenderSelected(String value) {
    gender = value;
    update();
  }

  Future<void> loadUserData() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      firstNameController.text = userModel?.firstName ?? '';
      lastNameController.text = userModel?.lastName ?? '';
      gender = userModel?.gender;
      
       
      if (userModel?.dob != null) {
        DateTime dob = DateTime.parse(userModel!.dob!);
        initialDate = dob;
        String formattedDate = DateFormat('dd MMMM yyyy').format(dob);

        dateController.text = formattedDate;
        dayController.text = dob.day.toString().padLeft(2, '0');
        monthController.text = dob.month.toString().padLeft(2, '0');
        yearController.text = dob.year.toString();
      }
      update();
    }
  }

  Future<void> changeInformation() async {
    String dob =
        '${yearController.text}-${monthController.text}-${dayController.text}';

    var response = await ChangeInformationApi.ChangeInformation(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      dob: dob,
      gender: gender,
    );
    if (response.isNotEmpty) {
      UiUtilites.successCustomSnackbar(
           "Changes saved successfully".tr,);
    } else {
      UiUtilites.errorSnackbar(
          "Change Information Error".tr, "Information is Not Change".tr);
    }
    update();
  }
}
