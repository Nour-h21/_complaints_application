abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final dynamic user;

  SignupSuccess(this.user);
}

class SignupFailed extends SignupState {
  final String message;

  SignupFailed(this.message);
}
