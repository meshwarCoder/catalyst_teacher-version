
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ForgetPasswordSuccess(this.message);
}
final class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;
  ForgetPasswordFailure(this.message);
}

