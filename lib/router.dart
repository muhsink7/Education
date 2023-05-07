import 'package:education/ui/screens/home_screen/home_screen.dart';
import 'package:education/ui/screens/login_screen/home_screen.dart';
import 'package:get/get.dart';
import 'ui/screens/splash_screen/splash_screen.dart';

class RoutePaths {
  static const String splash = '/';
  static const String loginScreen = '/login';
  static const String homeScreen = '/home';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutePaths.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutePaths.loginScreen,
      // binding: HomeBinding(),
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RoutePaths.homeScreen,
      // binding: HomeBinding(),
      page: () => const HomeScreen(),
    ),
  ];
}
