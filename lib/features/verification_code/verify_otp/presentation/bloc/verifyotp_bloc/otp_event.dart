abstract class OtpEvent  {}

class SubmitOtpEvent extends OtpEvent {
  final String otp;

  SubmitOtpEvent({required this.otp});

}


// part of 'resend_otp_bloc.dart';

// abstract class ResendOtpEvent {}

// class StartTimerEvent extends ResendOtpEvent {}

// class TickEvent extends ResendOtpEvent {}

// class ResendPressedEvent extends ResendOtpEvent {
//   final int userId;
//   ResendPressedEvent(this.userId);
// }
