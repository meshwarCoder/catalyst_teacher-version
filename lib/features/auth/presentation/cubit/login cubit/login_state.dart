part of 'login_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}
final class LoginCubitLoading extends LoginCubitState {}
final class LoginCubitSuccess extends LoginCubitState {
  final String message;
  LoginCubitSuccess(this.message);
}
final class LoginCubitError extends LoginCubitState {
  final String message;
  LoginCubitError(this.message);
}
