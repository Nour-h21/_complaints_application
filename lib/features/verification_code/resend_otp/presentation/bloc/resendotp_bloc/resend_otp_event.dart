part of 'resend_otp_bloc.dart';

abstract class ResendOtpEvent {}

class StartTimerEvent extends ResendOtpEvent {}

class TickEvent extends ResendOtpEvent {}

class ResendPressedEvent extends ResendOtpEvent {}

/// ⭐ الحدث الجديد عند انتهاء صلاحية الكود
class ExpiredOtpEvent extends ResendOtpEvent {}