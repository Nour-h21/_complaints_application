import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/signup_usecase.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUsecase useCase;

  SignupBloc(this.useCase) : super(SignupInitial()) {
    on<SubmitSignupEvent>(_signup);
  }

  Future<void> _signup(
      SubmitSignupEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    try {
      final user = await useCase(
        name: event.name,
        emailOrPhone: event.emailOrPhone,
        password: event.password,
        confirmPassword: event.confirmPassword,
      );
      print(user);
      emit(SignupSuccess(user));
    } catch (e) {
      emit(SignupFailed(e.toString().replaceAll("Exception: ", "")));
    }
  }
}