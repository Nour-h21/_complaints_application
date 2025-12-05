// import '../../domain/entities/signup_entity.dart';

// class SignupModel extends SignupEntity {
//   SignupModel({
//     required super.id,
//     required super.roleId,
//     required super.name,
//     required super.email,
//     required super.phone,
//     required super.photo,
//     required super.points,
//     required super.genderId,
//     required super.otpCode,
//     required super.otpExpiresAt,
//     required super.isVerified,
//   });

//   factory SignupModel.fromJson(Map<String, dynamic> json) {
//     final data = json["data"];

//     return SignupModel(
//       id: data["id"],
//       roleId: data["role_id"],
//       name: data["name"],
//       email: data["email"] ?? '',
//       phone: data["phone"] ?? '',
//       photo: data["photo"],
//       points: data["points"],
//       genderId: data["gender_id"],
//       otpCode: data["otp_code"],       // ← تصحيح
//       otpExpiresAt: data["otp_expires_at"], // ← تصحيح
//       isVerified: data["is_verified"] == 1,
//     );
//   }
// }


// features/auth/data/models/signup_model.dart

import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  SignupModel({
    required super.id,
    required super.roleId,
    required super.name,
    required super.email,
    // required super.phone,
    required super.photo,
    required super.points,
    required super.genderId,
    required super.otpCode,
    required super.otpExpiresAt,
    required super.isVerified,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    print("phone => ${json['phone']}");
print("city_id => ${json['city_id']}");
print("age => ${json['age']}");
print("gender_id => ${json['gender_id']}");
    
    return SignupModel(
      id: data['id'],
      roleId: data['role_id'],
      name: data['name'],
      email: data['email'],
      // phone: data['phone'],
      photo: data['photo'],
      points: data['points'],
      genderId: data["gender_id"],
      otpCode: data['otp_code'] ?? '',  // لو null → نضع فارغ
      otpExpiresAt: data['otp_expires_at'] ?? '',
      isVerified: data["is_verified"] == 1,

 
    );
    
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'role_id': roleId,
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'photo': photo,
  //     'points': points,
  //     'otp_code': otpCode,
  //     'otp_expires_at': otpExpiresAt,
  //     'is_verified': isVerified ,
  //   };
  // }
}

// import '../../domain/entities/signup_entity.dart';

// class SignupModel extends SignupEntity {
//   SignupModel({
//     required super.status,
//     required super.data,
//     required super.message,
//   });

//   factory SignupModel.fromJson(Map<String, dynamic> json) {
//     return SignupModel(
//       status: json['status'] ?? 0,
//       data: UserModel.fromJson(json['data'] ?? {}),
//       message: json['message'] ?? '',
//     );
//   }
// }

// class UserModel extends UserEntity {
//   UserModel({
//     required super.id,
//     required super.roleId,
//     required super.name,
//     required super.email,
//     required super.phone,
//     required super.photo,
//     required super.points,
//     required super.otpCode,
//     required super.otpExpiresAt,
//     required super.isVerified,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'] ?? 0,
//       roleId: json['role_id'] ?? 0,
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       phone: json['phone'],
//       photo: json['photo'] ?? '',
//       points: json['points'] ?? 0,
//       otpCode: json['otp_code'] ?? '',
//       otpExpiresAt: json['otp_expires_at'] ?? '',
//       isVerified: json['is_verified'] ?? 0,
//     );
//   }
// }
