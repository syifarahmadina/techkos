import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';  // If you have predefined routes in AppPages
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
      ),
      // Initial Route based on AppPages or directly using '/login'
      initialRoute: AppPages.INITIAL,  // Start at the login page or you can use '/login' directly
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),  // Login page
        GetPage(name: '/register', page: () => RegisterPage()),  // Register page
        GetPage(name: '/student_home', page: () => StudentHomePage()),  // Student Home
        GetPage(name: '/owner_home', page: () => OwnerHomePage()),  // Owner Home
      ],
    );
  }
}
