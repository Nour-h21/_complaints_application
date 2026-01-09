import '../../domain/entities/resend_otp_entity.dart';

class ResendOtpModel extends ResendOtpEntity {
  ResendOtpModel({
    required super.status,
    required super.message,
  });

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpModel(
      status: json['status'] ,
      message: json['message'] ?? '',
    );
  }
}
