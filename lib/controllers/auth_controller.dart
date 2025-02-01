import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool("isLoggedIn") ?? false;

    if (isLoggedIn.value) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
    isLoggedIn.value = true;
    Get.offAllNamed(AppRoutes.home);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
  }
}