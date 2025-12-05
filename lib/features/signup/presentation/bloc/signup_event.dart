abstract class SignupEvent {}

class SubmitSignupEvent extends SignupEvent {
  final String name;
  final String emailOrPhone;
  final String password;
  final String confirmPassword;

  SubmitSignupEvent({
    required this.name,
    required this.emailOrPhone,
    required this.password,
    required this.confirmPassword,
  });
}
