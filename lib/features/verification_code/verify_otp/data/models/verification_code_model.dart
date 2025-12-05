import '../../domain/entities/verification_code_entity.dart';

class VerifyOtpModel extends VerifyOtpEntity {
  VerifyOtpModel({required super.data, required super.message});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      data: json['data']?.toString() ?? '',  // تحويل أي شيء لـ String
      message: json['message']?.toString() ?? '',
    );
  }
}
