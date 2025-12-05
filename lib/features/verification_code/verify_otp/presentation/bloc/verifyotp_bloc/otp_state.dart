abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final String message;
  OtpSuccess(this.message);
}

class OtpFailed extends OtpState {
  final String message;
  OtpFailed(this.message);

}


// part of 'resend_otp_bloc.dart';

// enum ResendOtpStatus { initial, loading, success, error }

// class ResendOtpState {
//   final bool canResend;
//   final int secondsRemaining;
//   final ResendOtpStatus status;
//   final String message;

//   ResendOtpState({
//     required this.canResend,
//     required this.secondsRemaining,
//     required this.status,
//     required this.message,
//   });

//   ResendOtpState copyWith({
//     bool? canResend,
//     int? secondsRemaining,
//     ResendOtpStatus? status,
//     String? message,
//   }) {
//     return ResendOtpState(
//       canResend: canResend ?? this.canResend,
//       secondsRemaining: secondsRemaining ?? this.secondsRemaining,
//       status: status ?? this.status,
//       message: message ?? this.message,
//     );
//   }
// }
