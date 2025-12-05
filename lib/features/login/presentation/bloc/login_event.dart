abstract class LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  final String emailOrPhone;
  final String password;

  SubmitLoginEvent({required this.emailOrPhone, required this.password});
}
