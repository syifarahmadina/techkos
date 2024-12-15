import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF42a5f5), Color(0xFFbbdefb)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Top playful shape
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom playful shape
          Positioned(
            bottom: -60,
            right: -60,
            child: Container(
              width: 200,
              height: 200,
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
                    'assets/icons/register_illustration.svg',
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  // Welcome text
                  Text(
                    'Join Techkos!',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign up to find your perfect kost.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Register Form Card
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
                        // Custom Dropdown for User Type
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              // Show the dropdown when tapped
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.school, color: Colors.blue),
                                          title: Text('Student', style: GoogleFonts.poppins(fontSize: 18)),
                                          onTap: () {
                                            authController.setUserType('student');
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.home, color: Colors.blue),
                                          title: Text('Owner', style: GoogleFonts.poppins(fontSize: 18)),
                                          onTap: () {
                                            authController.setUserType('owner');
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.blue[200]!),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    authController.userType.value.isEmpty
                                        ? 'Select Role'
                                        : authController.userType.value.capitalizeFirst!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down, color: Colors.blue),
                                ],
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 20),
                        // Name Field with Icon
                        CustomTextField(
                          label: 'Name',
                          hintText: 'Enter your name',
                          controller: authController.nameController,
                          prefixIcon: Icon(Icons.person_outline, color: Colors.white),
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
                        // Register Button
                        CustomButton(
                          label: 'Register',
                          onPressed: () async {
                            if (authController.userType.value.isNotEmpty) {
                              await authController.register(); // Call register async method
                            } else {
                              Get.snackbar(
                                'Error',
                                'Please select your user type!',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Link to Login
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/login');
                    },
                    child: Text(
                      'Already have an account? Login here!',
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
