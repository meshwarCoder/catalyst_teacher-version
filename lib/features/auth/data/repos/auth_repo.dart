
import 'package:catalyst/core/errors/exceptions.dart';
import 'package:catalyst/features/auth/data/models/auth_response_model.dart';
import 'package:catalyst/features/auth/data/models/update_password_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponseModel>> login(Map<String, dynamic> loginData);
  Future<Either<Failure, AuthResponseModel>> signUp(Map<String, dynamic> signUpData);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UpdatePasswordResponseModel>> forgotPassword(Map<String, dynamic> forgotPasswordData);
  Future<Either<Failure, UpdatePasswordResponseModel>> verifyCode(Map<String, dynamic> verifyData);
  Future<Either<Failure, UpdatePasswordResponseModel>> resetPassword(Map<String, dynamic> resetPasswordData);

}