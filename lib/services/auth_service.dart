import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  // Register method
  Future<Map<String, dynamic>> register(UserModel user, String userType) async {
    // Define the URL based on user type
    Uri url;
    if (userType == 'student') {
      url = Uri.parse('http://localhost/apitechkos/public/register/student');
    } else {
      url = Uri.parse('http://localhost/apitechkos/public/register/owner');
    }

    // Send a POST request with the user details
    var response = await http.post(url, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
    });

    // Parse and return the response
    return json.decode(response.body);
  }

  // Login method (already implemented)
  Future<Map<String, dynamic>> login(UserModel user, String userType) async {
    Uri url;
    if (userType == 'student') {
      url = Uri.parse('http://localhost/apitechkos/public/login/student');
    } else {
      url = Uri.parse('http://localhost/apitechkos/public/login/owner');
    }

    var response = await http.post(url, body: {
      'email': user.email,
      'password': user.password,
    });

    return json.decode(response.body);
  }
}
