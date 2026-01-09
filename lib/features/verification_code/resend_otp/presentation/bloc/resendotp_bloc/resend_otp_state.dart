part of 'resend_otp_bloc.dart';

class ResendOtpState {
  final bool isButtonEnabled;
  final int duration;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  ResendOtpState({
    required this.isButtonEnabled,
    required this.duration,
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
  });

  factory ResendOtpState.initial() => ResendOtpState(
        isButtonEnabled: false,
        duration: 60,
      );

  ResendOtpState copyWith({
    bool? isButtonEnabled,
    int? duration,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
  }) {
    return ResendOtpState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      duration: duration ?? this.duration,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}