abstract class ChangePasswordEvent {}

class ForgotPasswordEvent extends ChangePasswordEvent {
  final String email;

  ForgotPasswordEvent({required this.email});
}

class CheckCodeEvent extends ChangePasswordEvent {
  final String code;

  CheckCodeEvent({required this.code});
}

class ResetPasswordEvent extends ChangePasswordEvent {
  final String password;
  final String confirmPassword;

  ResetPasswordEvent({
    required this.password,
    required this.confirmPassword,
  });
}
