import 'package:bloc/bloc.dart';

import '../../domain/usecase/login_usecase.dart';
import 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase useCase;
  LoginBloc(this.useCase) : super(LoginInitial()) {
    on<SubmitLoginEvent>(_login);
  }

  Future<void> _login(SubmitLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final user = await useCase(
        emailOrPhone: event.emailOrPhone,
        password: event.password,
      );

      emit(LoginSuccess(user));
    } catch (e) {
      final msg = e.toString().replaceAll("Exception: ", "");

      if (msg ==
          "الحساب غير مفعل، يجب تفعيل الحساب عبر رمز التحقق قبل تسجيل الدخول.") {
        emit(LoginNotVerified(event.emailOrPhone));
      } else {
        emit(LoginFailed(msg));
      }
    }
  }
}
