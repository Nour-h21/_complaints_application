import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  SignupModel({
    required super.id,
    required super.roleId,
    required super.name,
    required super.email,
    required super.phone,
    required super.photo,
    required super.points,
    required super.genderId,
    required super.otpCode,
    required super.otpExpiresAt,
    required super.isVerified,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"];

    return SignupModel(
      id: data["id"] ?? 0,
      roleId: data["role_id"] ?? 0,
      name: data["name"] ?? "",
      email: data["email"],              // nullable OK
      phone: data["phone"],              // nullable OK
      photo: data["photo"],              // ممكن يكون null → الآن مسموح
      points: data["points"] ?? 0,
      genderId: data["gender_id"],
      otpCode: data["otp_code"],
      otpExpiresAt: data["otp_expires_at"],
      isVerified: data["is_verified"] ?? 0,
    );
  }
}
