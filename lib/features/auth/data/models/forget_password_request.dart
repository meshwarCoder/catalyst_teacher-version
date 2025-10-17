import 'package:catalyst/core/api/constant.dart';

class ForgotPasswordRequest {
  final String email;

  ForgotPasswordRequest({required this.email});

  Map<String, dynamic> toJson() => {
        Body.email: email,
      };
}
