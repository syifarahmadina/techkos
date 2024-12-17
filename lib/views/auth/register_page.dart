import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
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
                    'Ayo Register untuk Menggunakan Techkos!',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Register untuk Menemukan Kost Sesuai Kriteriamu!',
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
                        // Dropdown for User Type
                        CustomDropdown(
                          label: 'Register sebagai',
                          items: ['Mahasiswa', 'Pemilik Kos'],
                          onChanged: authController.setUserType,
                        ),
                        SizedBox(height: 20),
                        // Name Field with Icon
                        CustomTextField(
                          label: 'Nama',
                          hintText: 'Ketik Nama Kamu',
                          controller: authController.nameController,
                          prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        // Email Field with Icon
                        CustomTextField(
                          label: 'Email',
                          hintText: 'Ketik Email Kamu',
                          controller: authController.emailController,
                          prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        // Password Field with Icon
                        CustomTextField(
                          label: 'Password',
                          hintText: 'Ketik Password Kamu',
                          obscureText: true,
                          controller: authController.passwordController,
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                        ),
                        SizedBox(height: 30),
                        // Register Button
                        CustomButton(
                          label: 'Register',
                          onPressed: authController.register,
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
                      'Sudah punya akun? Silahkan Login Disini!',
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
