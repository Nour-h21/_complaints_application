class SignupEntity {
  final int id;
  final int roleId;
  final String name;
  final String? email;
  final String? phone;
  final String? photo;         // ← صارت nullable
  final int points;
  final String? genderId;      // ← صارت nullable
  final String? otpCode;       // ← صارت nullable
  final String? otpExpiresAt;  // ← صارت nullable
  final int isVerified;

  SignupEntity({
    required this.id,
    required this.roleId,
    required this.name,
    this.email,
    this.phone,
    this.photo,
    required this.points,
    this.genderId,
    this.otpCode,
    this.otpExpiresAt,
    required this.isVerified,
  });
}
