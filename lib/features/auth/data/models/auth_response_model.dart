class AuthResponseModel {
  final bool success;
  final String message;
  final Data data;

  AuthResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String token;
  final int id;
  final String fullName;
  final String email;
  final String type;

  Data({
    required this.token,
    required this.id,
    required this.fullName,
    required this.email,
    required this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'fullName': fullName,
      'email': email,
      'type': type,
    };
  }
}
