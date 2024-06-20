
class Validators {

static String? emailValidator(String? email) {
    print(email);
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );

    if (email == null) {
      return null;
    } else if (email.isEmpty) {
      return "Email can't be empty";
    } else if (!emailRegExp.hasMatch(email)) {
      return "Invalid Email Address";
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? password) {
    // ignore: unnecessary_raw_strings
    final digitRegExp =
        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{1,}$');

    if (password == null) {
      return null;
    } else if (password.isEmpty) {
      return "Password can't be empty";
    } else if (password.length < 6) {
      return "Password must be 6 characters long";
    } else {
      return null;
    }
  }

  /// Validates the confirm Password for User Authentication
  static String? confrimPasswordValidator(
      String? newpassword, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return "Password can't be empty";
    } else if (newpassword == confirmPassword) {
      return null;
    } else {
      return "Password and confirm password are not same!";
    }
  }
}