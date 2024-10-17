import 'package:get/get.dart';

class Validators {
  static String? emailValidator(String? email) {
    print(email);
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );

    if (email == null) {
      return null;
    } else if (email.isEmpty) {
      return "Email cannot be empty".tr;
    } else if (!emailRegExp.hasMatch(email)) {
      return "Invalid Email Address".tr;
    } else {
      return null;
    }
  }

    static String? alphabeticValidator(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return "$fieldName can only contain alphabets";
    }
    return null;
  }

   static String? usernameValidator(String fieldName,String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty";
    } else if (value.length < 1 || value.length > 30) {
      return "Username must be between 1 and 30 characters";
    } else if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(value)) {
      return "Username can only contain letters, numbers, underscores (_), and periods (.)";
    }
    
    // Assume checkUsernameAvailability is a function that checks the availability
    if (!checkUsernameAvailability(value)) {
      return "Username is already taken";
    }

    return null;
  }

  // Mock function for checking username availability
  static bool checkUsernameAvailability(String username) {
    // This should be replaced with an actual API call
    // Return true if the username is available, otherwise false
    return true; // Just a placeholder
  }

  static String? emptyStringValidator(
    String key,
    String? value,
  ) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return "$key" + "can't be empty".tr;
    } else {
      return null;
    }
  }
  


   static String? passwordValidator(String? password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?!.*[!@#\$&*~]).{6,}$',
    );

    if (password == null || password.isEmpty) {
      return "Password can't be empty".tr;
    } else if (password.length < 6) {
      return "Must be 6 characters long".tr;
    } else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(password)) {
      return "Must include an uppercase letter".tr;
    } else if (!RegExp(r'^(?=.*?[a-z])').hasMatch(password)) {
      return "Must include a lowercase letter".tr;
    } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(password)) {
      return "Must include a number".tr;
    } else if (RegExp(r'[!@#\$&*~]').hasMatch(password)) {
      return "No special characters allowed".tr;
    } else {
      return null;
    }
  }

  /// Validates the confirm Password for User Authentication
  static String? confrimPasswordValidator(
      String? newpassword, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return "Password can't be empty".tr;
    } else if (newpassword == confirmPassword) {
      return null;
    } else {
      return "Password and confirm password are not same!".tr;
    }
  }
}
