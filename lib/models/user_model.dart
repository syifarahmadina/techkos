class UserModel {
  final String? name;  // Make name optional
  final String email;
  final String password;

  UserModel({
    this.name,  // Allow name to be optional
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
