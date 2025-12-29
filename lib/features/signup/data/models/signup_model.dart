import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  SignupModel({
    required super.id,
    required super.roleId,
    required super.name,
     super.email,
     super.phone,
     super.photo,
    required super.points,
     super.genderId,
    required super.otpCode,
    required super.otpExpiresAt,
    required super.isVerified,
    // required super.cityId,
    // required super.emailVerifiedAt,
     super.fcmToken
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
  final data = json["data"] as Map<String, dynamic>?;

  return SignupModel(
    id: data?["id"] ?? 0,
    roleId: data?["role_id"] ?? 0,
    name: (data?["name"] as String?) ?? "",   // ⭐️ الحل
    email: data?["email"] as String?,
    phone: data?["phone"] as String?,
    photo: data?["photo"] as String?,
    points: data?["points"] ?? 0,
    genderId: data?["gender_id"]?.toString(),
    otpCode: data?["otp_code"] as String,
    otpExpiresAt: data?["otp_expires_at"] as String,
    isVerified: data?["is_verified"] ?? 0,
    fcmToken: data?["fcm_token"] as String?,
  );
}
}
