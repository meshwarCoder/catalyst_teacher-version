import 'package:catalyst/core/errors/exceptions.dart';
import 'package:catalyst/features/auth/data/models/auth_response_model.dart';
import 'package:catalyst/features/auth/data/models/signup_request.dart';
import 'package:catalyst/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(this._authRepo) : super(RegisterCubitInitial());

  final AuthRepoImplementation _authRepo;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    emit(RegisterCubitLoading());

    Either<Failure, AuthResponseModel> result = await _authRepo.signUp( SignUpRequest(
      fullName: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    ).toJson());

    result.fold(
      (failure) => emit(RegisterCubitError(failure.errMessage)),
      (data) => emit(RegisterCubitSuccess(data.message)),
    );
  }
}
