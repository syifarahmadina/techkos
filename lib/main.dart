import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/auth/login_page.dart';
import 'views/auth/register_page.dart';
import 'views/student_pages/student_home_page.dart';
import 'views/owner_pages/owner_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Techkos',
      initialRoute: '/login',  // Start at the login page
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/student_home', page: () => StudentHomePage()),
        GetPage(name: '/owner_home', page: () => OwnerHomePage()),
      ],
    );
  }
}
