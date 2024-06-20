import 'package:find_me/api/auth_api.dart/register_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignInController extends GetxController {
  static SignInController instance = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //! Password And Confirm Password Variable and Functions
  bool obscureTextPassword = true;
  bool obscureTextCPassword = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? completePhone;
  String phone = '';
  bool isCompleteNumber = false;
  UserModel? user;
  void toggle() {
    obscureTextPassword = !obscureTextPassword;
    update();
  }

  void ctoggle() {
    obscureTextCPassword = !obscureTextCPassword;
    update();
  }

  //! Phone Input Field Variable and Validations
  String invalidNumberMessage = '';
  TextEditingController pcontroller = TextEditingController();
  Country? selectedCountry =
      countries.firstWhere((country) => country.fullCountryCode == "971");
  PhoneNumber? checkphoneController;
  String? phoneController;

  onCountryChanged(Country value) {
    selectedCountry = value;
    pcontroller.clear();
    update();
    if (checkphoneController != null) phoneValidation(checkphoneController);
  }

  phoneValidation(phone) {
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

  //! Date of Birth Selection
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 100, now.month, now.day);
    final DateTime lastDate = DateTime(now.year - 10, now.month, now.day);
    final DateTime initialDate = lastDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      dayController.text = picked.day.toString().padLeft(2, '0');
      monthController.text = picked.month.toString().padLeft(2, '0');
      yearController.text = picked.year.toString();
    }
  }

  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }
  //  loginUser() async {
  //     //  final token = await FirebaseMessaging.instance.getToken();

  //   Map<String, dynamic> response = await LoginApi.loginUser(
  //     password: passwordController.text,
  //     email: emailController.text,
  //     token: token
  //   );
  //   if (response.isNotEmpty) {
  //     box.write('api_token', response['user']['token']);
  //     Get.toNamed(AppRoutes.mainview);
  //   }
  // }

  final _authApi = RegisterApi();
  loginGoogleUser(name, email) async {
    var responce = await _authApi.googleLogin(name, email);
    return responce;
  }
}
