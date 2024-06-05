import 'package:find_me/app/auth/signup/signup_binding.dart';
import 'package:find_me/app/auth/signup/signup_view.dart';
import 'package:find_me/app/intro/intro_binding.dart';
import 'package:find_me/app/intro/intro_view.dart';
import 'package:find_me/app/splash/splash_binding.dart';
import 'package:find_me/app/splash/splash_view.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    //TODO:  [Splash Route]
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 350),
    ),

    //TODO:  [Choose login or signup]
    GetPage(
      name: AppRoutes.intro,
      page: () => const IntroView(),
      binding: IntroBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),

    //TODO: [Signup Route]
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  ];
}
