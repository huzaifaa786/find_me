import 'dart:io';

import 'package:find_me/app.dart';
import 'package:find_me/components/helper/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoadingHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
   Stripe.publishableKey =
      "pk_test_51NjyPoKj8kRF1XiuJAv5r6UPr91km5JqWugq5FWvrfUDtOcew75SLLnk09zXOWM3RjmxebIg5vB845xYtUFI16ck00mbTgntzu";
  //Load our .env file that contains  our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  HttpOverrides.global = MyHttpOverrides(); 
  runApp(const App());
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
