abstract class ApiService {
  Future<dynamic> get({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> patch({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}