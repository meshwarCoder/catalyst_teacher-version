import 'package:catalyst/features/auth/data/models/login_request.dart';
import 'package:catalyst/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:catalyst/features/auth/data/models/auth_response_model.dart';
import 'package:catalyst/core/errors/exceptions.dart';

part 'login_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit(this._authRepo) : super(LoginCubitInitial());
  final AuthRepoImplementation _authRepo;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginCubitLoading());

    Either<Failure, AuthResponseModel> result = await _authRepo.login( LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    ).toJson());

    result.fold(
      (failure) => emit(LoginCubitError(failure.errMessage)),
      (data) => emit(LoginCubitSuccess(data.message)),
    );
  }
}
