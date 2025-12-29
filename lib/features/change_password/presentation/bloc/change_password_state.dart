abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ForgotPasswordSuccess extends ChangePasswordState {}

class CheckCodeSuccess extends ChangePasswordState {}

class ResetPasswordSuccess extends ChangePasswordState {}



class ChangePasswordFailed extends ChangePasswordState {
  final String message;

  ChangePasswordFailed(this.message);
}
