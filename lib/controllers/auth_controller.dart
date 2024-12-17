import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var userRole = "".obs; // Track the user's role
  var userType = ''.obs; // Track the selected user type (Student or Owner)

  // Controllers for login form
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Hardcoded credentials for testing
  final String studentEmail = 'joshua@gmail.com';
  final String studentPassword = 'joshua123';
  final String ownerEmail = 'bibi@gmail.com';
  final String ownerPassword = 'bibi23';

  // Set the user type for registration (Student or Owner)
  void setUserType(String? value) {
    userType.value = value ?? '';
  }

  // Login function
  void login() {
    // Ensure user type is selected
    if (userType.value.isEmpty) {
      Get.snackbar('Error', 'Please select a user type',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    // Check if email and password are filled
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    // Match credentials for Student
    if (emailController.text == studentEmail &&
        passwordController.text == studentPassword &&
        userType.value == "Mahasiswa") {
      userRole.value = "Mahasiswa";
      Get.offNamed('/student_home'); // Navigate to Student Home
    }
    // Match credentials for Owner
    else if (emailController.text == ownerEmail &&
        passwordController.text == ownerPassword &&
        userType.value == "Pemilik Kos") {
      userRole.value = "Pemilik Kos";
      Get.offNamed('/owner_home'); // Navigate to Owner Home
    }
    // Invalid credentials or mismatched user type
    else {
      Get.snackbar('Error', 'Invalid email, password, or user type',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // Register function
  void register() {
    // Ensure user type is selected
    if (userType.value.isEmpty) {
      Get.snackbar('Error', 'Please select a user type',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    // Check if all fields are filled
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    // Check if passwords match
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    // Implement registration logic here
    print('Registering as ${userType.value} with email ${emailController.text}');
  }
}
