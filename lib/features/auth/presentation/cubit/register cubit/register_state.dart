sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}
final class RegisterCubitLoading extends RegisterCubitState {}
final class RegisterCubitSuccess extends RegisterCubitState {
  final String successMessage;
  RegisterCubitSuccess(this.successMessage);
}
final class RegisterCubitError extends RegisterCubitState {
  final String errorMessage;
  RegisterCubitError(this.errorMessage);
}

