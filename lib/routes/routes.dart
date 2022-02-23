import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_shop/logic/binding/auth_binding.dart';
import 'package:my_shop/view/screens/auth/forget_password_screen.dart';
import 'package:my_shop/view/screens/auth/login_screen.dart';
import 'package:my_shop/view/screens/auth/signup_screen.dart';
import 'package:my_shop/view/screens/welcome_screen.dart';

class AppRoutes {
  ///initial route
  static const welcome = Routes.welcomeScreen;

  ///get pages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () =>  SignUpScreen(),
      binding: AuthBinding(),
    ), GetPage(
      name: Routes.forgetPasswordScreen,
      page: () =>  const ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
}
