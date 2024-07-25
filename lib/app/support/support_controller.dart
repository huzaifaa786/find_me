// import 'package:find_me/api/auth_api.dart/user_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  static SupportController get instance => Get.find();
  UserModel? userModel;
  String emailAddress = 'uk359863@gmail.com';
  String subject = 'Hello from my Flutter app!';
  String body = 'This is the body of the email.';

  Future<void> sendEmail() async {
    if (emailAddress.isNotEmpty) {
      final Uri url = Uri(
        scheme: 'mailto',
        path: emailAddress,
        query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
      );
      if (await canLaunch(url.toString())) {
        await launch(url.toString());
      } else {
        throw 'Could not launch $url';
      }
    } else {
      throw 'Email address is empty';
    }
  }
}
