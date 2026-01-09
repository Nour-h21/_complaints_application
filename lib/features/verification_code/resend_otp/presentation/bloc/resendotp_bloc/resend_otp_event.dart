part of 'resend_otp_bloc.dart';

abstract class ResendOtpEvent {}

class StartTimerEvent extends ResendOtpEvent {}

class TimerTickedEvent extends ResendOtpEvent {
  final int duration;
  TimerTickedEvent(this.duration);
}

class ResendCodePressedEvent extends ResendOtpEvent {}