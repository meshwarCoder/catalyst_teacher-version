import 'package:catalyst/core/api/constant.dart';
import 'package:catalyst/core/api/dio_service.dart';
import 'package:catalyst/core/errors/exceptions.dart';
import 'package:catalyst/features/auth/data/models/auth_response_model.dart';
import 'package:catalyst/features/auth/data/models/update_password_model.dart';
import 'package:catalyst/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImplementation implements AuthRepo {
    final DioService dioService;
    AuthRepoImplementation({required this.dioService});

    // =================== login ===================
    @override
    Future<Either<Failure, AuthResponseModel>> login(Map<String, dynamic> loginData) async {
      try {
        final response = await dioService.post(path: EndPoint.login,data: loginData);
        return right(AuthResponseModel.fromJson(response));
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
        
      }
    }

    // =================== signUp ===================
    @override
    Future<Either<Failure, AuthResponseModel>> signUp(Map<String, dynamic> signUpData) async {
      try {
        final response = await dioService.post(path: EndPoint.signUp,data: signUpData);
        return right(AuthResponseModel.fromJson(response));
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    }

    // =================== signOut ===================
    @override
    Future<Either<Failure, AuthResponseModel>> signOut() async {
      try {
        final response = await dioService.post(path: EndPoint.signUp);
        return right(AuthResponseModel.fromJson(response));
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
        
      }
    }

    // =================== forgotPassword ===================
    @override
    Future<Either<Failure, UpdatePasswordResponseModel>> forgotPassword(Map<String, dynamic> forgotPasswordData) async {
      try {
        final response = await dioService.post(path: EndPoint.forgotPassword,data: forgotPasswordData);
        return right(UpdatePasswordResponseModel.fromJson(response));
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    }

    // =================== verifyCode ===================
    @override
    Future<Either<Failure, UpdatePasswordResponseModel>> verifyCode(Map<String, dynamic> verifyData) async {
      try {
        final response = await dioService.post(path: EndPoint.verifyCode,data: verifyData);
        return right(UpdatePasswordResponseModel.fromJson(response));
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    }
    
    // =================== resetPassword ===================
      @override
      Future<Either<Failure, UpdatePasswordResponseModel>> resetPassword(Map<String, dynamic> resetPasswordData) async {
    try {
      final response = await dioService.post(path: EndPoint.resetPassword,data: resetPasswordData);
      return right(UpdatePasswordResponseModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
      }
    

}
  