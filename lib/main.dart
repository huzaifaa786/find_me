import 'dart:io';
import 'package:find_me/app.dart';
import 'package:find_me/components/helper/loading.dart';
import 'package:find_me/helpers/store_helper.dart';
import 'package:find_me/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoadingHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(NotificationService());
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  });

  await GetStorage.init();
  Stripe.publishableKey = "pk_test_51PqWumELPBv6icsjGiifpakgvyikustWRGQZo2CreTgWTApPULXrKnbmYHb01N8LlVCc98SMP0p0LRx17uI0gvnS00oD6kvMpJ";
  await dotenv.load(fileName: "assets/.env");
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (Platform.isIOS) {
    StoreHelper(
      store: Store.appStore,
      apiKey: "appl_fCRKvdvpltjXbBLAFXDNqEoKmhI",
    );
  } else if (Platform.isAndroid) {
    StoreHelper(
      store: Store.playStore,
      apiKey: "goog_bYFHCOyjSHobDnWGmtsqZPUGASI",
    );
  }
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
