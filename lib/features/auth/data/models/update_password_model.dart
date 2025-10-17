class UpdatePasswordResponseModel {
  final bool success;
  final String message;
  final dynamic data; // ممكن تكون null أو String (زي الـ token)

  UpdatePasswordResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory UpdatePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}
