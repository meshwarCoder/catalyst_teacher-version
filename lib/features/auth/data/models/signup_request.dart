import 'package:catalyst/core/api/constant.dart';

class SignUpRequest {
  final String fullName;
  final String email;
  final String password;

  SignUpRequest({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        Body.fullName: fullName,
        Body.email: email,
        Body.password: password,
      };
}
