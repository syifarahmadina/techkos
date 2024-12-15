import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controllers for name and password fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle saving the changes
  void _saveChanges() {
    String newName = _nameController.text;
    String newPassword = _passwordController.text;

    // Validate if the name and password are not empty
    if (newName.isEmpty || newPassword.isEmpty) {
      // Show error message if fields are empty
      Get.snackbar('Error', 'Name and Password cannot be empty',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }

    // Perform save logic here, e.g., update the user profile in the database
    // For now, we just show a confirmation message
    Get.snackbar('Success', 'Profile updated successfully!',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);

    // Optionally, navigate back after saving
    // Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name input field
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Password input field
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your new password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            // Save Changes button
            Center(
              child: ElevatedButton(
                onPressed: _saveChanges, // Trigger the save function when clicked
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D47A1), // Set the button color
                ),
                child: Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
