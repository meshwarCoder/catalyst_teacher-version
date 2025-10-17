import 'package:catalyst/features/auth/data/models/forget_password_request.dart';
import 'package:catalyst/features/auth/data/models/reset_password_request.dart';
import 'package:catalyst/features/auth/data/models/verify_code_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'forget_password_state.dart';
import 'package:catalyst/features/auth/data/repos/auth_repo.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo authRepo;
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  TextEditingController emailController = TextEditingController();

  late String code ;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late String resetToken;



  // =================== forgotPasswordPage (enter email) ===================
  Future<void> forgotPassword() async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.forgotPassword(ForgotPasswordRequest(email: emailController.text).toJson());
    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.errMessage)),
      (data) => emit(ForgetPasswordSuccess(data.message)),
    );
  }

  // =================== verifyCodePage (enter code) ===================
  Future<void> verifyCode() async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.verifyCode(VerifyCodeRequest(email: emailController.text, code: code).toJson());
    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.errMessage)),
      (data) {
        resetToken = data.data;
        emit(ForgetPasswordSuccess(data.message));
      },
    );
  }

  // =================== resetPasswordPage (enter new password) ===================
  Future<void> resetPassword() async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.resetPassword(ResetPasswordRequest(resetToken: resetToken, newPassword: passwordController.text).toJson());
    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.errMessage)),
      (data) => emit(ForgetPasswordSuccess(data.message)),
    );
  }
}
