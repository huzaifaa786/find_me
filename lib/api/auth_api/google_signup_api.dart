import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignUpApi {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  String _userName = '';
  String _userEmail = '';

  String getUserName() {
    return _userName;
  }

  String getUserEmail() {
    return _userEmail;
  }

  signUpWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Fetch the user's email and name
      _userEmail = googleUser.email;
      _userName = googleUser.displayName ?? '';

      // Use the email and name as needed
      print('Email: $_userEmail');
      print('Name: $_userName');
    }

    return [_userEmail, _userName];
  }
}
