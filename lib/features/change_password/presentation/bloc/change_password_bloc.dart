import 'package:complaints_application/features/change_password/domain/usecase/check_code_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/forgot_password_usecase.dart';

import '../../domain/usecase/reset_password_usecase.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ForgotPasswordUsecase useCase;
  final CheckCodeUsecase useCase1;
  final ResetPasswordUsecase useCase2;
  String? _code;

  ChangePasswordBloc(this.useCase, this.useCase1, this.useCase2)
    : super(ChangePasswordInitial()) {
    on<ForgotPasswordEvent>(_forgotPassword);
    on<CheckCodeEvent>(_checkCode);
    on<ResetPasswordEvent>(_resetPassword);
  }

  Future<void> _forgotPassword(
    ForgotPasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(ChangePasswordLoading());

    try {
      final result = await useCase(email: event.email);
      print("ppppppppppppppppppppppppppp${result}");
      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailed(e.toString().replaceAll("Exception: ", "")));
    }
  }

  Future<void> _checkCode(
    CheckCodeEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(ChangePasswordLoading());

    try {
      final result = await useCase1(code: event.code);
      _code = result.code;
      print(result);
      emit(CheckCodeSuccess());
    } catch (e) {
      emit(ChangePasswordFailed(e.toString().replaceAll("Exception: ", "")));
    }
  }

  Future<void> _resetPassword(
      ResetPasswordEvent event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordLoading());

    try {
      final result = await useCase2(
        code: _code!,
        password: event.password,
        confirmPassword: event.confirmPassword
      );
      print(result);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailed(e.toString().replaceAll("Exception: ", "")));
    }
  }
}
