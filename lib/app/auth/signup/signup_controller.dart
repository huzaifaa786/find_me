import 'package:find_me/api/auth_api/register_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

class SignUpController extends GetxController {
  static SignUpController instance = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GetStorage box = GetStorage();
  UserModel? user;
  String gender = "";

  //! Password And Confirm Password Variable and Functions
  bool obscureTextPassword = true;
  bool obscureTextCPassword = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? completePhone;
  String phone = '';
  bool isCompleteNumber = false;

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
      countries.firstWhere((country) => country.code == "US");
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

  //! Date of Birth Selection
  final dateController = TextEditingController();

  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime now = DateTime.now();
  //   final DateTime firstDate = DateTime(now.year - 100, now.month, now.day);
  //   final DateTime lastDate = DateTime(now.year - 10, now.month, now.day);
  //   final DateTime initialDate = lastDate;

  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate,
  //     firstDate: firstDate,
  //     lastDate: lastDate,
  //   );
  //   if (picked != null) {
  //     dayController.text = picked.day.toString().padLeft(2, '0');
  //     monthController.text = picked.month.toString().padLeft(2, '0');
  //     yearController.text = picked.year.toString();
  //   }
  // }

  Future<void> selectDatee(BuildContext context) async {
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
      // Format the date as 'dd/MM/yyyy'
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      dateController.text = formattedDate; // Update the dateController
      dayController.text = picked.day.toString().padLeft(2, '0');
      monthController.text = picked.month.toString().padLeft(2, '0');
      yearController.text = picked.year.toString();
    }
  }

  void openDatePicker(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime maxDate = DateTime(now.year, now.month, now.day);
    final DateTime minDate = DateTime(now.year - 100, now.month, now.day);
    final DateTime initialDate = DateTime(now.year - 18, now.month, now.day);
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
    requestPermissions();
    super.onInit();
  }

  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Future<void> requestPermissions() async {
    Location location = new Location();

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    await location.requestPermission();
    final permissions = [
      Permission.locationWhenInUse,
    ];

    for (var permission in permissions) {
      if (!await permission.isGranted) {
        await permission.request();
      }
    }
    if (!(await _geolocator.isLocationServiceEnabled())) {
      await _geolocator.openLocationSettings();
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   dayController.dispose();
  //   monthController.dispose();
  //   yearController.dispose();
  //   super.dispose();
  // }

  registerUser() async {
    final token = await FirebaseMessaging.instance.getToken();
    String dob =
        '${yearController.text}-${monthController.text}-${dayController.text}';
    print(dob);
    // Generate a UUID for the device's beacon ID
    var uuid = const Uuid();
    String beaconId = uuid.v4();
    if ((await _geolocator.isLocationServiceEnabled() && await Permission.location.isGranted)) {
      Position position = await Geolocator.getCurrentPosition();

      Map<String, dynamic> response = await RegisterApi.registerUser(
          name: nameController.text,
          password: passwordController.text,
          email: emailController.text,
          phone: phoneController,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          gender: gender,
          dob: dob == "--" ? null :dob,
          lat: position.latitude,
          lng: position.longitude,
          token: token,
          beaconId: beaconId);
      if (response.isNotEmpty) {
        Get.offNamed(AppRoutes.otp, arguments: phoneController);
      }
    } else {
      UiUtilites.errorSnackbar(
          "Location Permission Not Allowed", "Please Turn on Location!"); 
    }
  }

  final _authApi = RegisterApi();
  loginGoogleUser(name, email) async {
    var responce = await _authApi.googleLogin(name, email);
    return responce;
  }

  void handleGenderSelected(String value) {
    gender = value;
    update();
  }

  launchWebUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      UiUtilites.errorSnackbar("", "Invalid Url");
    }
  }
}
