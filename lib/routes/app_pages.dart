import 'package:get/get.dart';
import '../views/auth/login_page.dart';
import '../views/auth/register_page.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.LOGIN;

  static final routes = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
    ),
  ];
}
