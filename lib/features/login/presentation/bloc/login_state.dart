part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final dynamic user;

  LoginSuccess(this.user);
}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed(this.message);
}
