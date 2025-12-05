import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.id,
    required super.roleId,
    required super.name,
    required super.email,
    required super.phone,
    required super.photo,
    required super.points,
    required super.genderId,
    required super.isVerified,
    required super.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"];

    return LoginModel(
      id: data["id"],
      roleId: data["role_id"],
      name: data["name"],
      email: data["email"],
      phone: data["phone"],
      photo: data["photo"],
      points: data["points"],
      genderId: data["gender_id"],
      isVerified: data["is_verified"] == 1,
      token: data["token"],
    );
  }
}
