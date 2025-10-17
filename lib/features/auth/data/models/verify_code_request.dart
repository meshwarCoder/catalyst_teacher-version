import 'package:catalyst/core/api/constant.dart';

class VerifyCodeRequest {
  final String email;
  final String code;

  VerifyCodeRequest({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        Body.email: email,
        Body.code: code,
      };
}
