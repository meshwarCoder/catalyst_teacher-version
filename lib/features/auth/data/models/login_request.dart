import 'package:catalyst/core/api/constant.dart';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        Body.email: email,
        Body.password: password,
      };
}
