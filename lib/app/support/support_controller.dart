// import 'package:find_me/api/auth_api.dart/user_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  static SupportController get instance => Get.find();
  UserModel? userModel;
  String emailAddress = 'contact@findme-app.net';
  String subject = '';
  String body = '';

  Future<void> sendEmail() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    await launchUrl(url);
  }
}
