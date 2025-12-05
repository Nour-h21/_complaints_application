class SignupEntity {
  final int id;
  final int roleId;
  final String name;
  final String? email;
  // final String? phone;
  final String photo;
  final int points;
  final int? genderId;
  final String otpCode;
  final String otpExpiresAt;
  final bool isVerified;

  SignupEntity({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    // required this.phone,
    required this.photo,
    required this.points,
    required this.genderId,
    required this.otpCode,
    required this.otpExpiresAt,
    required this.isVerified,
  });
}


// features/auth/domain/entities/signup_entity.dart

// class SignupEntity {
//   final int status;
//   final UserEntity data;
//   final String message;

//   SignupEntity({
//     required this.status,
//     required this.data,
//     required this.message,
//   });
// }

// class UserEntity {
//   final int id;
//   final int roleId;
//   final String name;
//   final String? email;
//   final String? phone;
//   final String photo;
//   final int points;
//   final String otpCode;
//   final String otpExpiresAt;
//   final int isVerified;

//   UserEntity({
//     required this.id,
//     required this.roleId,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.photo,
//     required this.points,
//     required this.otpCode,
//     required this.otpExpiresAt,
//     required this.isVerified,
//   });
// }


