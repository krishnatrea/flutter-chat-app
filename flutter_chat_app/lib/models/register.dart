import 'dart:convert';


class UserRegister {
  String name; 
  String email;
  String password;
  UserRegister({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserRegister.fromMap(Map<String, dynamic> map) {
    return UserRegister(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRegister.fromJson(String source) => UserRegister.fromMap(json.decode(source));
}
