import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/screens/Signup/Signup_screen/Signup_screen.dart';
import 'package:x_station_app/view/screens/electrican_details/electrican_details_screen/electrican_details_screen.dart';
import 'package:x_station_app/view/screens/forget_password/forget_password_screen/forget_password_screen.dart';
import 'package:x_station_app/view/screens/home_layout/home_layout.dart';
import 'package:x_station_app/view/screens/login/login_screen/login_screen.dart';
import 'package:x_station_app/view/screens/login/login_widget/login_form/login_form.dart';
import 'package:x_station_app/view/screens/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:x_station_app/view/screens/reset_password/reset_password_screen/reset_password_screen.dart';
import 'package:x_station_app/view/screens/splash/splash_screen/splash_screen.dart';
import 'package:x_station_app/view/screens/verification/verification_screen/verification_screen.dart';
import 'package:x_station_app/view/screens/verification/verification_widget/verification_widget.dart';

List<GetPage> pages = [
  GetPage(
      name: PageName.splash,
      page: () => const SplashScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
  GetPage(
      name: PageName.onBoarding,
      page: () => const OnBoardingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
  GetPage(
      name: PageName.login,
      page: () => const LoginScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
  GetPage(
      name: PageName.register,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),

       GetPage(
      name: PageName.verification,
      page: () => const VerificationScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
  GetPage(
      name: PageName.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
  GetPage(
      name: PageName.resetPassword,
      page: () => const ResetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
  GetPage(
      name: PageName.homeLayout,
      page: () => const LayoutScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
  GetPage(
      name: PageName.electricianDetails,
      page: () => const ElectricianDetailsScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(
        milliseconds: 250,
      )),
];
