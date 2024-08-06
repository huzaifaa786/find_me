import 'package:find_me/app/splash/splash_binding.dart';
import 'package:find_me/app/splash/splash_view.dart';
import 'package:find_me/routes/app_pages.dart';
import 'package:find_me/translation.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, child) => GetMaterialApp(
        translations: LocaleString(),
        locale: box.read('locale') != 'ar'
            ? Locale('en', 'US')
            : Locale('ar', 'AE'),
        fallbackLocale: box.read('locale') != 'ar'
            ? Locale('en', 'US')
            : Locale('ar', 'AE'),
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
            primary: AppColors.primary_color,
          ),
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
          scaffoldBackgroundColor: AppColors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.black,
          ),
          fontFamily: 'Inter',
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        title: "FIND ME",
        initialBinding: SplashBinding(),
        home: const SplashView(),
        getPages: AppPages.pages,
      ),
    );
  }
}

