import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString userType = ''.obs; // Start with an empty string, indicating no user type is selected yet
  final AuthService _authService = AuthService();

  // Set the selected user type (either 'student' or 'owner')
  void setUserType(String? value) {
    if (value != null) userType.value = value; // Update the userType reactively
  }

  // Register method (already implemented)
  Future<void> register() async {
    if (userType.value.isEmpty) {
      // Make sure userType is selected before proceeding
      Get.snackbar(
        'Error',
        'Please select your user type!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      final user = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final response = await _authService.register(user, userType.value); // Pass userType.value to the service

      Get.snackbar(
        'Success',
        response['message'] ?? 'Registered successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      nameController.clear();
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Add a login method to handle user login
  Future<void> login() async {
    try {
      final user = UserModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: '', // Name is optional for login
      );

      final response = await _authService.login(user, userType.value); // Pass userType.value to the service

      if (response['success']) {
        // Navigate to the appropriate page based on the user type
        if (userType.value == 'student') {
          Get.offAllNamed('/studentHome');
        } else if (userType.value == 'owner') {
          Get.offAllNamed('/ownerHome');
        }

        // Optionally show a success message
        Get.snackbar(
          'Success',
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // Handle failure (e.g., incorrect login credentials)
        Get.snackbar(
          'Error',
          response['message'] ?? 'Login failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Handle any errors that occur during login
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
