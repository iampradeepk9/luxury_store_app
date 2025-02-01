import 'package:get/get.dart';
import '../views/splash_view.dart';
import '../views/login_view.dart';
import '../views/home_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: home, page: () => HomeView()),
  ];
}