import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0d47a1), Color(0xFF64b5f6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Top playful shape
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom playful shape
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Page content
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Fun illustration
                  SvgPicture.asset(
                    'assets/icons/login_illustration.svg',
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  // Welcome text
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Log in to explore your dream kost.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Login Form Card
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2), // Frosted glass effect
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Dropdown for User Type
                        CustomDropdown(
                          label: 'Login as',
                          items: ['Student', 'Owner'],
                          onChanged: authController.setUserType,
                        ),
                        SizedBox(height: 20),
                        // Email Field with Icon
                        CustomTextField(
                          label: 'Email',
                          hintText: 'Enter your email',
                          controller: authController.emailController,
                          prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        // Password Field with Icon
                        CustomTextField(
                          label: 'Password',
                          hintText: 'Enter your password',
                          obscureText: true,
                          controller: authController.passwordController,
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                        ),
                        SizedBox(height: 30),
                        // Login Button
                        CustomButton(
                          label: 'Login',
                          onPressed: () {
                            authController.login();  // Call the login method from AuthController
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Link to Register
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: Text(
                      'Don’t have an account? Register here!',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
