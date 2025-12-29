import '../../domain/entities/reset_password_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity {
  ResetPasswordModel({
    required super.token,
    required super.role,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"];

    return ResetPasswordModel(
      token: data['token'],
      role: data['role'],
    );
  }
}