import '../../domain/entities/forgot_password_entity.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  ForgotPasswordModel({
    required super.email,
    required super.code,
    required super.role,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"];

    return ForgotPasswordModel(
      email: data['email'],
      code: data['code'],
      role: data['role'],
    );
  }
}
