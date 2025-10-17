import 'package:catalyst/core/api/constant.dart';

class ResetPasswordRequest {
  final String resetToken;
  final String newPassword;

  ResetPasswordRequest({
    required this.resetToken,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() => {
        Body.resetToken: resetToken,
        Body.newPassword: newPassword,
      };
}
