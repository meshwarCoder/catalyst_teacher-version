import 'package:catalyst/core/api/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:catalyst/features/auth/data/repos/auth_repo_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImplementation>(
    AuthRepoImplementation(dioService: DioService(dio: Dio())),
  );
}